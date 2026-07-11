resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_name
  location            = var.location
  resource_group_name = var.rg_name
  tags                = var.tags
  dns_prefix          = var.dns_prefix
  sku_tier            = "Free"
  oidc_issuer_enabled = true

  default_node_pool {
    name            = var.node_pool_name
    node_count      = var.node_count
    vm_size         = var.node_vm_size
    os_disk_type    = var.os_disk_type
    os_disk_size_gb = 64
  }

  identity {
    type = "SystemAssigned"
  }
  key_vault_secrets_provider {
    secret_rotation_enabled = true
  }

}

