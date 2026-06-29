resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "azurerm_mssql_server" "server" {
  name                         = var.server_name
  resource_group_name          = var.rg_name
  location                     = var.location
  version                      = "12.0"
  tags                         = var.tag
  administrator_login          = var.sql_admin_username
  administrator_login_password = random_password.password.result

}

resource "azurerm_mssql_firewall_rule" "azure" {
  name             = "access_azure_portal"
  server_id        = azurerm_mssql_server.server.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "0.0.0.0"
}

resource "azurerm_mssql_firewall_rule" "checker" {
  name             = var.sq_fw_rule
  server_id        = azurerm_mssql_server.server.id
  start_ip_address = var.allowed_ip_address
  end_ip_address   = var.allowed_ip_address


}

resource "azurerm_mssql_database" "database" {
  name      = var.db_name
  server_id = azurerm_mssql_server.server.id
  #collation    = "SQL_Latin1_General_CP1_CI_AS"
  #license_type = "LicenseIncluded"
  #max_size_gb  = 2
  sku_name = var.sku
  #enclave_type = "VBS"
  tags = var.tag


}

data "azurerm_key_vault" "kv_exist" {
  name                = var.kv_name
  resource_group_name = var.kv_rg
}

resource "azurerm_key_vault_secret" "username" {
  name         = var.kv_admin_name
  value        = var.sql_admin_username
  key_vault_id = data.azurerm_key_vault.kv_exist.id
}

resource "azurerm_key_vault_secret" "password" {
  name         = var.kv_admin_pass
  value        = random_password.password.result
  key_vault_id = data.azurerm_key_vault.kv_exist.id
}





