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