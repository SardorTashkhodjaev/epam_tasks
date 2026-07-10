resource "azurerm_container_group" "aci" {
  name                = var.aci_name
  location            = var.location
  resource_group_name = var.rg_name

  os_type         = "Linux"
  ip_address_type = "Public"
  dns_name_label  = var.aci_name
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
      CREATOR        = "ACI"
      REDIS_PORT     = "6380"
      REDIS_SSL_MODE = "True"
    }

    secure_environment_variables = {
      REDIS_URL = var.redis_hostname
      REDIS_PWD = var.redis_primary_key
    }
  }

  exposed_port {
    port     = 8080
    protocol = "TCP"
  }
}