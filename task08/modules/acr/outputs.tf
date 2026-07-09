output "login_server" {
  value       = azurerm_container_registry.acr.login_server
  description = "The login of the ACR"
}

output "admin_username" {
  value       = azurerm_container_registry.acr.admin_username
  description = "The username of the ACR"
}

output "admin_password" {
  value       = azurerm_container_registry.acr.admin_password
  description = "The passw of the ACR"
  sensitive   = true
}

output "acr_id" {
  value       = azurerm_container_registry.acr.id
  description = "The ID of the ACR"
}