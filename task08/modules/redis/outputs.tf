output "redis_id" {
  description = "Azure Redis Cache ID"
  value       = azurerm_redis_cache.redis.id
}

output "hostname" {
  description = "Azure Redis Cache hostname"
  value       = azurerm_redis_cache.redis.hostname
}

output "primary_access_key" {
  description = "Azure Redis Cache primary access key"
  value       = azurerm_redis_cache.redis.primary_access_key
  sensitive   = true
}