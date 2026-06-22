output "name" {
  value = azurerm_resource_group.rg_module.name
  description = "Resource Group name"
  }


output "location" {
  value = azurerm_resource_group.rg_module.location
  description = "Resource Group location"
  }
