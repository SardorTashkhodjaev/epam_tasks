output "rg_id" {
  value       = azurerm_resource_group.rg_name.id
  description = "Resource Group ID"
}

output "sa_blob_endpoint" {
  value       = azurerm_storage_account.storage_name.primary_blob_endpoint
  description = "Storage account blob service primary endpoint"
}

output "vnet_id" {
  value       = azurerm_virtual_network.vnet_name.id
  description = "Virtual network ID"
}
