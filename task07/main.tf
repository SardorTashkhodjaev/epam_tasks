provider "azurerm" {
  features {}
}

import {
  to = azurerm_resource_group.rg
  id = "/subscriptions/573ca0aa-e84c-48fe-86d9-6a27d550faf3/resourceGroups/cmtr-tkdmv90y-mod7-rg"

}

resource "azurerm_resource_group" "rg" {
  location = var.location
  name     = local.rg_name
  tags     = var.tag
}

resource "azurerm_storage_account" "storage" {
  name                             = var.storage_account_name
  resource_group_name              = azurerm_resource_group.rg.name
  tags                             = var.tag
  location                         = azurerm_resource_group.rg.location
  allow_nested_items_to_be_public  = false
  cross_tenant_replication_enabled = false
  account_tier                     = "Standard"
  account_replication_type         = "LRS"
}

import {
  to = azurerm_storage_account.storage
  id = "/subscriptions/573ca0aa-e84c-48fe-86d9-6a27d550faf3/resourceGroups/cmtr-tkdmv90y-mod7-rg/providers/Microsoft.Storage/storageAccounts/cmtrtkdmv90ymod7sa"
}

module "cdn" {
  source            = "./modules/cdn"
  tag               = var.tag
  location          = azurerm_resource_group.rg.location
  rg_name           = azurerm_resource_group.rg.name
  fd_name           = local.cdn_fd_profile_name
  sku               = var.cdn_fd_sku
  endpoint_name     = local.cdn_fd_endpoint_name
  or_gr_name        = local.cdn_fd_origin_group_name
  fd_origin_name    = local.cdn_fd_origin_name
  fd_route_name     = var.cdn_fd_route_name
  primary_blob_host = azurerm_storage_account.storage.primary_blob_host
}


