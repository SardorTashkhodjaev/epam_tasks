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

  name     = var.app_service_plans["asp1"].name
  sku_name = var.app_service_plans["asp1"].sku_name
  os       = var.app_service_plans["asp1"].os
  location = module.rg_main1.location
  rg_name  = module.rg_main1.name
  tag      = var.tag
  worker   = var.app_service_plans["asp1"].worker
}

module "asp2" {
  source = "./modules/app_service_plan"

  name     = var.app_service_plans["asp2"].name
  sku_name = var.app_service_plans["asp2"].sku_name
  os       = var.app_service_plans["asp2"].os
  location = module.rg_main2.location
  rg_name  = module.rg_main2.name
  tag      = var.tag
  worker   = var.app_service_plans["asp2"].worker
}

/* module "asp1" {
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

} */


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

module "tm" {
  source = "./modules/traffic_manager"

  name      = var.tm
  rg_name   = module.rg_main3.name
  tm_method = var.tm_method
  tag       = var.tag
  dns_name  = var.tm_dns_name

  endpoints = {
    wsp1 = {
      name               = "wsp1-endpoint"
      target_resource_id = module.wsp1.id
      weight             = var.tm_endpoints["wsp1"].weight
    }

    wsp2 = {
      name               = "wsp2-endpoint"
      target_resource_id = module.wsp2.id
      weight             = var.tm_endpoints["wsp2"].weight
    }
  }
}
