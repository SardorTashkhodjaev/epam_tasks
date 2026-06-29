provider "azurerm" {
  features {}

}

resource "azurerm_resource_group" "task6" {
  name     = local.rg_name
  location = var.location
  tags     = var.tag
}

module "webapp" {
  source = "./modules/webapp"

  asp_name = local.asp_name
  rg_name  = azurerm_resource_group.task6.name
  location = azurerm_resource_group.task6.location
  os       = var.asp_os
  sku      = var.asp_sku
  tag      = var.tag

  web_app_name = local.app_name
  dotnet       = var.dotnet_vers

  sql_connection_string = module.sql.sql_connection_string

}

module "sql" {
  source = "./modules/sql"

  server_name        = local.sql_server_name
  rg_name            = azurerm_resource_group.task6.name
  location           = azurerm_resource_group.task6.location
  tag                = var.tag
  allowed_ip_address = var.allowed_ip_address
  db_name            = local.sql_db_name
  sku                = var.sql_model
  sql_admin_username = var.sql_admin_username
  sq_fw_rule         = var.sql_fw_rule_name
  kv_name            = var.ex_kv_name
  kv_rg              = var.ex_kv_rg_name
  kv_admin_name      = var.kv_sql_admin_name
  kv_admin_pass      = var.kv_sql_admin_pass

}
