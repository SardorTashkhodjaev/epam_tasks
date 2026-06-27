resource "azurerm_mssql_server" "example" {
  name                = var.server_name
  resource_group_name = var.rg_name
  location            = var.location
  version             = "12.0"

  azuread_administrator {
    login_username = "AzureAD Admin"
    object_id      = "00000000-0000-0000-0000-000000000000"
  }

  tags = var.tag

}

resource "azurerm_mssql_database" "example" {
  name      = var.db_name
  server_id = azurerm_mssql_server.example.id
  #collation    = "SQL_Latin1_General_CP1_CI_AS"
  #license_type = "LicenseIncluded"
  #max_size_gb  = 2
  sku_name = var.sku
  #enclave_type = "VBS"

  tags = var.tag
}