provider "azurerm" {
  features {}
}

module "rg_main1" {
  source   = "./modules/resource_group"
  name     = var.resource_groups["rg1"].name
  location = var.resource_groups["rg1"].location
  tag      = var.tag

}

module "rg_main2" {
  source   = "./modules/resource_group"
  name     = var.resource_groups["rg2"].name
  location = var.resource_groups["rg2"].location
  tag      = var.tag

}

module "rg_main3" {
  source   = "./modules/resource_group"
  name     = var.resource_groups["rg3"].name
  location = var.resource_groups["rg3"].location
  tag      = var.tag

}

module "asp1" {
  source = "./modules/app_service_plan"

  name = var.app_service_plans["asp1"].name
  #worker_count = var.app_service_plans["asp1"].worker_count
  sku      = var.app_service_plans["asp1"].sku_name
  location = module.rg_main1.location
  rg_name  = module.rg_main1.name
  tag      = var.tag

}


module "asp2" {
  source = "./modules/app_service_plan"

  name = var.app_service_plans["asp2"].name

  sku      = var.app_service_plans["asp2"].sku_name
  location = module.rg_main2.location
  rg_name  = module.rg_main2.name
  tag      = var.tag

}


module "wsp1" {
  source          = "./modules/app_service"
  name            = var.app1_name
  location        = module.rg_main1.location
  rg_name         = module.rg_main1.name
  asp_id          = module.asp1.id
  tag             = var.tag
  ip_restrictions = var.ip_restriction

}

module "wsp2" {
  source          = "./modules/app_service"
  name            = var.app2_name
  location        = module.rg_main2.location
  rg_name         = module.rg_main2.name
  asp_id          = module.asp2.id
  ip_restrictions = var.ip_restriction
  tag             = var.tag
}


resource "azurerm_traffic_manager_profile" "tm" {
  name                   = var.tm
  resource_group_name    = module.rg_main3.name
  traffic_routing_method = var.tm_method

  dns_config {
    relative_name = "tm-dns-config-name"
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
}