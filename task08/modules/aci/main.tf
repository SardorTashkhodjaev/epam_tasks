resource "azurerm_container_group" "aci" {
  name                = var.aci_name
  location            = var.location
  resource_group_name = var.rg_name

  os_type         = "Linux"
  ip_address_type = "Public"
  restart_policy  = "Always"

  tags = var.tags

  image_registry_credential {
    server   = var.login_server
    username = var.admin_username
    password = var.admin_password
  }

  container {
    name  = var.aci_name
    image = "${var.login_server}/${var.image_name}:latest"

    cpu    = 0.5
    memory = 1.5

    ports {
      port     = 8080
      protocol = "TCP"
    }

    environment_variables = {
      REDIS_HOSTNAME = var.redis_hostname
    }

    secure_environment_variables = {
      REDIS_PRIMARY_KEY = var.redis_primary_key
    }
  }

  exposed_port {
    port     = 8080
    protocol = "TCP"
  }
}