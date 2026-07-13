provider "azurerm" {
  features {}
}

module "afw" {
  source = "./modules/afw"

  rg_name             = local.rg_name
  vnet_name           = local.vnet_name
  subnet_name         = var.subnet_name
  name_prefix         = var.name_prefix
  fw_pip              = local.fw_pip
  location            = var.location
  aks_loadbalancer_ip = var.aks_loadbalancer_ip
  tags                = var.tags
}

