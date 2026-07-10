provider "azurerm" {
  features {}
}

data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "rg" {
  name     = local.rg_name
  location = var.location
  tags     = var.tags
}


module "kv" {
  source = "./modules/keyvault"

  kv_name  = local.keyvault_name
  location = var.location
  rg_name  = azurerm_resource_group.rg.name
  tags     = var.tags
  sku      = var.kv_sku
}

module "acr" {
  source     = "./modules/acr"
  acr_name   = local.acr_name
  rg_name    = azurerm_resource_group.rg.name
  location   = var.location
  sku        = var.acr_sku
  tags       = var.tags
  image_name = local.docker_name
  git_pat    = var.git_pat

}

module "redis" {
  source = "./modules/redis"

  name        = local.redis_name
  location    = var.location
  rg_name     = azurerm_resource_group.rg.name
  capacity    = var.redis_capacity
  family      = var.redis_sku_family
  sku         = var.redis_sku
  tags        = var.tags
  hostname    = var.redis_secret_hostname
  primary_key = var.redis_secret_pr_key
  kv_id       = module.kv.key_vault_id
}

module "aci" {
  source = "./modules/aci"

  aci_name = local.aci_name
  location = var.location
  rg_name  = azurerm_resource_group.rg.name
  tags     = var.tags

  login_server   = module.acr.login_server
  admin_username = module.acr.admin_username
  admin_password = module.acr.admin_password

  image_name = local.docker_name

  redis_hostname    = module.redis.hostname
  redis_primary_key = module.redis.primary_access_key

  depends_on = [
    module.acr
  ]
}

module "aks" {
  source = "./modules/aks"

  aks_name       = local.aks_name
  location       = var.location
  rg_name        = azurerm_resource_group.rg.name
  node_pool_name = var.aks_np_name
  node_count     = var.aks_np_ins_count
  node_vm_size   = var.aks_np_ins_node_size
  os_disk_type   = var.aks_np_os
  tags           = var.tags
  dns_prefix     = local.aks_name
}

resource "azurerm_role_assignment" "aks_acr" {
  principal_id         = module.aks.kubelet_object_id
  role_definition_name = "AcrPull"
  scope                = module.acr.acr_id
}

resource "azurerm_key_vault_access_policy" "aks_kv_policy" {

  key_vault_id = module.kv.key_vault_id

  tenant_id = data.azurerm_client_config.current.tenant_id

  object_id = module.aks.key_vault_secret_identity_object_id

  secret_permissions = [
    "Get",
    "List"
  ]
}

provider "kubectl" {
  host                   = module.aks.host
  cluster_ca_certificate = base64decode(module.aks.cluster_ca_certificate)
  client_certificate     = base64decode(module.aks.client_certificate)
  client_key             = base64decode(module.aks.client_key)
  load_config_file       = false
}

provider "kubernetes" {
  host                   = module.aks.host
  cluster_ca_certificate = base64decode(module.aks.cluster_ca_certificate)
  client_certificate     = base64decode(module.aks.client_certificate)
  client_key             = base64decode(module.aks.client_key)
}



resource "kubectl_manifest" "secret_provider" {
  yaml_body = templatefile(
    "${path.module}/k8s-manifests/secret-provider.yaml.tftpl",
    {
      aks_kv_access_identity_id  = module.aks.key_vault_secret_identity_client_id
      kv_name                    = local.keyvault_name
      redis_url_secret_name      = var.redis_secret_hostname
      redis_password_secret_name = var.redis_secret_pr_key
      tenant_id                  = data.azurerm_client_config.current.tenant_id
    }
  )

  depends_on = [
    module.aks,
    azurerm_key_vault_access_policy.aks_kv_policy,
    azurerm_role_assignment.aks_acr
  ]
}

resource "kubectl_manifest" "deployment" {
  yaml_body = templatefile(
    "${path.module}/k8s-manifests/deployment.yaml.tftpl",
    {
      acr_login_server = module.acr.login_server
      app_image_name   = local.docker_name
      image_tag        = "latest"
    }
  )

  depends_on = [
    kubectl_manifest.secret_provider, module.redis
  ]

  wait_for {
    field {
      key   = "status.availableReplicas"
      value = "1"
    }
  }

  
}

resource "kubectl_manifest" "service" {
  yaml_body = file("${path.module}/k8s-manifests/service.yaml")

  depends_on = [
    kubectl_manifest.deployment
  ]

  wait_for {
    field {
      key        = "status.loadBalancer.ingress.[0].ip"
      value      = "^(\\d+(\\.|$)){4}"
      value_type = "regex"
    }
  }
}


data "kubernetes_service_v1" "app" {
  metadata {
    name      = "redis-flask-app-service"
    namespace = "default"
  }

  depends_on = [
    kubectl_manifest.service
  ]
}