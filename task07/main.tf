provider "azurerm" {
  features {}


import {
  to = azurerm_resource_group.rg
  id = var.resource_group_id

}

resource "azurerm_resource_group" "rg" {
  location = var.location
  name = locals.rg_name
  tags = var.tag
}

resource "azurerm_storage_account" "storage" {
  name = locals.storage_account_name
  resource_group_name = azurerm_resource_group.rg.name
  tags = var.tag
  location = azurerm_resource_group.rg.location
  allow_nested_items_to_be_public  = false
  cross_tenant_replication_enabled = false
}

import {
  to = azurerm_storage_account.storage
  id = var.storage_account_id
}
