resource "azurerm_service_plan" "asp" {
  name                = var.name
  location            = var.location
  resource_group_name = var.rg_name

  os_type      = var.os
  sku_name     = var.sku_name
  worker_count = var.worker
  tags         = var.tag
}


/* resource "azurerm_app_service_plan" "aasp" {
  name                = var.name
  location            = var.location
  resource_group_name = var.rg_name
  sku {
    tier     = var.sku.tier
    size     = var.sku.size
    capacity = var.sku.capacity
  }
  tags = var.tag

} */