resource "azurerm_resource_group" "rg_module" {
  name     = var.name
  location = var.location
  tags     = var.tag
}
