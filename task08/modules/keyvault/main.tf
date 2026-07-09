data "azurerm_client_config" "current" {
}



resource "azurerm_key_vault" "kv" {
  name                = var.kv_name
  location            = var.location
  resource_group_name = var.rg_name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  tags                = var.tags
  sku_name            = var.sku

  soft_delete_retention_days = 7
  purge_protection_enabled   = false
}

resource "azurerm_key_vault_access_policy" "kv_policy" {
  key_vault_id = azurerm_key_vault.kv.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = data.azurerm_client_config.current.object_id

  secret_permissions = [
    "Backup", "Delete", "Get", "List", "Purge", "Recover", "Restore", "Set"
  ]

}