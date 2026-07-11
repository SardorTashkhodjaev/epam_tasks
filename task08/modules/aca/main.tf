resource "azurerm_user_assigned_identity" "aca_identity" {
  name                = "${var.aca_name}-identity"
  location            = var.location
  resource_group_name = var.rg_name

  tags = var.tags
}

resource "azurerm_key_vault_access_policy" "aca" {
  key_vault_id = var.keyvault_id
  tenant_id    = var.tenant_id
  object_id    = azurerm_user_assigned_identity.aca_identity.principal_id

  secret_permissions = [
    "Get",
    "List"
  ]
}

resource "azurerm_role_assignment" "acr_pull" {
  scope                = var.acr_id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_user_assigned_identity.aca_identity.principal_id
}

resource "azurerm_container_app_environment" "aca_env" {
  name                = var.aca_env_name
  location            = var.location
  resource_group_name = var.rg_name

  tags = var.tags
}

resource "azurerm_container_app" "aca" {
  name                         = var.aca_name
  resource_group_name          = var.rg_name
  container_app_environment_id = azurerm_container_app_environment.aca_env.id
  revision_mode                = "Single"

  identity {
    type         = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.aca_identity.id]
  }

  registry {
    server   = var.login_server
    identity = azurerm_user_assigned_identity.aca_identity.id
  }

  secret {
    name                = "redis-url"
    key_vault_secret_id = var.redis_hostname_secret_id
    identity            = azurerm_user_assigned_identity.aca_identity.id
  }

  secret {
    name                = "redis-key"
    key_vault_secret_id = var.redis_password_secret_id
    identity            = azurerm_user_assigned_identity.aca_identity.id
  }

  ingress {
    external_enabled = true
    target_port      = 8080

    traffic_weight {
      latest_revision = true
      percentage      = 100
    }
  }

  template {
    container {
      name   = "application"
      image  = "${var.login_server}/${var.image_name}:latest"
      cpu    = 0.5
      memory = "1Gi"

      env {
        name  = "CREATOR"
        value = "ACA"
      }

      env {
        name  = "REDIS_PORT"
        value = "6379"
      }

      env {
        name        = "REDIS_URL"
        secret_name = "redis-url"
      }

      env {
        name        = "REDIS_PWD"
        secret_name = "redis-key"
      }
    }
  }

  tags = var.tags

  depends_on = [
    azurerm_key_vault_access_policy.aca,
    azurerm_role_assignment.acr_pull
  ]
}