provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg_name" {
  name     = var.rg_name
  location = var.location
  tags     = var.tag
}

resource "azurerm_storage_account" "storage_name" {
  name                     = var.storage_name
  resource_group_name      = azurerm_resource_group.rg_name.name
  tags                     = var.tag
  location                 = azurerm_resource_group.rg_name.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

}

resource "azurerm_virtual_network" "vnet_name" {
  name                = var.vnet_name
  resource_group_name = azurerm_resource_group.rg_name.name
  tags                = var.tag
  location            = azurerm_resource_group.rg_name.location
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "subnet1" {
  name                 = var.subnet1_name
  resource_group_name  = azurerm_resource_group.rg_name.name
  virtual_network_name = azurerm_virtual_network.vnet_name.name
  address_prefixes     = ["10.0.1.0/24"]

}

resource "azurerm_subnet" "subnet2" {
  name                 = var.subnet2_name
  resource_group_name  = azurerm_resource_group.rg_name.name
  virtual_network_name = azurerm_virtual_network.vnet_name.name
  address_prefixes     = ["10.0.2.0/24"]


}