output "redis_fqdn" {
  description = "Redis Fully Qualified Domain Name"
  value       = azurerm_container_group.redis.fqdn
}

output "redis_hostname" {
  description = "Redis hostname"
  value       = azurerm_container_group.redis.fqdn
}

output "redis_password" {
  description = "Redis generated password"
  value       = random_password.redis_password.result
  sensitive   = true
}

output "redis_hostname_secret_id" {
  description = "Redis hostname Key Vault secret ID"
  value       = azurerm_key_vault_secret.hostname.id
}

output "redis_password_secret_id" {
  description = "Redis password Key Vault secret ID"
  value       = azurerm_key_vault_secret.password.id
}