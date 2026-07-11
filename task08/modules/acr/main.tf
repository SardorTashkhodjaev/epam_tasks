resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = var.rg_name
  location            = var.location
  sku                 = var.sku
  tags                = var.tags
  admin_enabled       = true

}

resource "azurerm_container_registry_task" "docker_task" {
  name                  = var.task_name
  container_registry_id = azurerm_container_registry.acr.id
  platform {
    os = "Linux"
  }
  docker_step {
    dockerfile_path      = var.dockerfile_path
    context_path         = var.blob_url
    context_access_token = var.sas_token
    image_names = [
      "${var.image_name}:{{.Run.ID}}",
      "${var.image_name}:latest"
    ]
  }

  
}

resource "azurerm_container_registry_task_schedule_run_now" "set_schedule" {
  container_registry_task_id = azurerm_container_registry_task.docker_task.id
}