resource "azurerm_service_plan" "example" {
  name                = var.asp_name
  resource_group_name = var.rg_name
  location            = var.location
  os_type             = var.os
  sku_name            = var.sku
  tags                = var.tag
}

resource "azurerm_linux_web_app" "example" {
  name                = var.web_app_name
  resource_group_name = var.rg_name
  location            = var.location
  service_plan_id     = azurerm_service_plan.example.id
  #dotnet_version = var.dotnet
  tags = var.tag
  site_config {
    application_stack {
      dotnet_version = var.dotnet
    }
  }
  connection_string {
    name  = "sqlconnection"
    type  = "SQLAzure"
    value = var.sql_connection_string
  }
}
