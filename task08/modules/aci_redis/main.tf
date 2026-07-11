resource "random_password" "redis_password" {
  length  = 16
  special = true
}

resource "azurerm_container_group" "redis" {
  name                = var.aci_name
  location            = var.location
  resource_group_name = var.rg_name

  os_type         = "Linux"
  ip_address_type = "Public"
  dns_name_label  = var.aci_name
  restart_policy  = "Always"

  tags = var.tags

  container {
    name   = "redis"
    image  = "mcr.microsoft.com/cbl-mariner/base/redis:6.2"
    cpu    = 1
    memory = 1.5

    commands = [
      "redis-server",
      "--protected-mode", "no",
      "--requirepass", random_password.redis_password.result
    ]

    ports {
      port     = 6379
      protocol = "TCP"
    }
  }

  exposed_port {
    port     = 6379
    protocol = "TCP"
  }
}

resource "azurerm_key_vault_secret" "hostname" {
  name         = var.redis_hostname_secret_name
  value        = azurerm_container_group.redis.fqdn
  key_vault_id = var.keyvault_id
}

resource "azurerm_key_vault_secret" "password" {
  name         = var.redis_password_secret_name
  value        = random_password.redis_password.result
  key_vault_id = var.keyvault_id
}