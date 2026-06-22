resource "azurerm_app_service_plan" "aasp" {
  name                = var.name
  location            = var.location
  resource_group_name = var.rg_name
  sku {
    tier     = var.sku.tier
    size     = var.sku.size
    capacity = var.sku.capacity
  }
  tags = var.tag

}