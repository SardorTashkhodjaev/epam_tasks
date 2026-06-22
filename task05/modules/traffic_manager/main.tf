resource "azurerm_traffic_manager_profile" "tm" {
  name                   = var.name
  resource_group_name    = var.rg_name
  traffic_routing_method = var.tm_method

  dns_config {
    relative_name = var.dns_name
    ttl           = 100
  }

  monitor_config {
    protocol                     = "HTTP"
    port                         = 80
    path                         = "/"
    interval_in_seconds          = 30
    timeout_in_seconds           = 9
    tolerated_number_of_failures = 3
  }

  tags = var.tag
}


resource "azurerm_traffic_manager_azure_endpoint" "endpoints" {
  for_each = var.endpoints

  name                 = each.value.name
  profile_id           = azurerm_traffic_manager_profile.tm.id
  target_resource_id   = each.value.target_resource_id
  weight               = each.value.weight
  always_serve_enabled = true
}

/* 
resource "azurerm_traffic_manager_azure_endpoint" "end" {


  name                 = var.wsp_name
  profile_id           = var.tm_id
  always_serve_enabled = true
  weight               = 100
  target_resource_id   = var.wsp_id
}




resource "azurerm_traffic_manager_azure_endpoint" "end1" {
  name                 = module.wsp1.name
  profile_id           = azurerm_traffic_manager_profile.tm.id
  always_serve_enabled = true
  weight               = 100
  target_resource_id   = module.wsp1.id
}

resource "azurerm_traffic_manager_azure_endpoint" "end2" {
  name                 = module.wsp2.name
  profile_id           = azurerm_traffic_manager_profile.tm.id
  always_serve_enabled = true
  weight               = 100
  target_resource_id   = module.wsp2.id
} */