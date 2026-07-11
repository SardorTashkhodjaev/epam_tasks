provider "azurerm" {
  features {}
}

data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "rg" {
  name     = local.rg_name
  location = var.location
  tags     = var.tags
}

module "storage" {
  source = "./modules/storage"

  name     = local.sa_name
  rg_name  = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location

  sa_repl_type   = var.sa_repl_type
  sa_cont_name   = var.sa_cont_name
  sa_access_type = var.sa_access_type

  application_path = "${path.module}/application"

  tags = var.tags

  depends_on = [
    azurerm_resource_group.rg
  ]
}

module "keyvault" {
  source = "./modules/keyvault"

  kv_name  = local.keyvault_name
  rg_name  = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location

  sku  = var.kv_sku
  tags = var.tags

  depends_on = [
    azurerm_resource_group.rg
  ]
}


module "aci" {
  source = "./modules/aci_redis"

  aci_name = local.redis_aci_name
  location = var.location
  rg_name  = azurerm_resource_group.rg.name

  keyvault_id                = module.keyvault.key_vault_id
  redis_hostname_secret_name = var.redis_secret_hostname
  redis_password_secret_name = var.redis_secret_pass

  tags = var.tags

  depends_on = [
    module.keyvault
  ]
}


module "acr" {
  source = "./modules/acr"

  acr_name = local.acr_name
  rg_name  = azurerm_resource_group.rg.name
  location = var.location

  sku = var.acr_sku

  image_name = local.docker_name

  dockerfile_path = "task08/application/Dockerfile"

  blob_url  = module.storage.blob_url
  sas_token = module.storage.sas_token

  tags = var.tags

  depends_on = [
    module.storage
  ]
}

module "aca" {
  source = "./modules/aca"

  aca_name     = local.aca_name
  aca_env_name = local.aca_env_name

  location = var.location
  rg_name  = azurerm_resource_group.rg.name

  workload_profile_type = var.aca_type

  login_server = module.acr.login_server
  image_name   = local.docker_name

  acr_id = module.acr.acr_id

  tenant_id = data.azurerm_client_config.current.tenant_id

  keyvault_id = module.keyvault.key_vault_id

  redis_hostname_secret_id = module.aci.redis_hostname_secret_id
  redis_password_secret_id = module.aci.redis_password_secret_id

  tags = var.tags

  depends_on = [
    module.acr,
    module.aci
  ]
}


module "aks" {
  source = "./modules/aks"

  aks_name = local.aks_name

  location = var.location
  rg_name  = azurerm_resource_group.rg.name

  dns_prefix = local.aks_name

  node_pool_name = var.aks_np_name
  node_count     = var.aks_np_ins_count
  node_vm_size   = var.aks_np_ins_node_size
  os_disk_type   = var.aks_np_os

  tags = var.tags
}



resource "azurerm_role_assignment" "aks_acr" {
  scope                = module.acr.acr_id
  role_definition_name = "AcrPull"

  principal_id = module.aks.kubelet_object_id
}



resource "azurerm_key_vault_access_policy" "aks_kv_policy" {

  key_vault_id = module.keyvault.key_vault_id

  tenant_id = data.azurerm_client_config.current.tenant_id

  object_id = module.aks.key_vault_secret_identity_object_id

  secret_permissions = [
    "Get",
    "List"
  ]
}


module "k8s" {

  source = "./modules/k8s"

  providers = {
    kubectl    = kubectl
    kubernetes = kubernetes
  }

  deployment_template = "${path.module}/k8s-manifests/deployment.yaml.tftpl"

  secret_provider_template = "${path.module}/k8s-manifests/secret-provider.yaml.tftpl"

  service_manifest = "${path.module}/k8s-manifests/service.yaml"

  aks_kv_access_identity_id = module.aks.key_vault_secret_identity_client_id

  kv_name = local.keyvault_name

  tenant_id = data.azurerm_client_config.current.tenant_id

  redis_url_secret_name      = var.redis_secret_hostname
  redis_password_secret_name = var.redis_secret_pass

  acr_login_server = module.acr.login_server

  image_name = local.docker_name

  depends_on = [
    module.aks,
    module.acr,
    module.aci,
    azurerm_role_assignment.aks_acr,
    azurerm_key_vault_access_policy.aks_kv_policy
  ]
}


