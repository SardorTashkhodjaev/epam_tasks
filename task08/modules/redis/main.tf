resource "azurerm_redis_cache" "redis" {
  name                 = var.name
  location             = var.location
  resource_group_name  = var.rg_name
  capacity             = var.capacity
  family               = var.family
  sku_name             = var.sku
  tags                 = var.tags
  non_ssl_port_enabled = false
  redis_configuration {
  }
}

resource "azurerm_key_vault_secret" "hostname" {
  name         = var.hostname
  value        = azurerm_redis_cache.redis.hostname
  key_vault_id = var.kv_id
}

resource "azurerm_key_vault_secret" "pr_key" {
  name         = var.primary_key
  value        = azurerm_redis_cache.redis.primary_access_key
  key_vault_id = var.kv_id
}

