output "aca_fqdn" {
  description = "Fully Qualified Domain Name of Azure Container App"
  value       = azurerm_container_app.aca.latest_revision_fqdn
}

output "identity_id" {
  description = "User Assigned Identity ID"
  value       = azurerm_user_assigned_identity.aca_identity.id
}

output "principal_id" {
  description = "Principal ID of User Assigned Identity"
  value       = azurerm_user_assigned_identity.aca_identity.principal_id
}

output "environment_id" {
  description = "Azure Container App Environment ID"
  value       = azurerm_container_app_environment.aca_env.id
}

output "identity_client_id" {
  description = "Client ID of User Assigned Identity"
  value       = azurerm_user_assigned_identity.aca_identity.client_id
}