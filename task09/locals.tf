locals {
  rg_name     = format("%s-rg", var.name_prefix)
  aks_cluster = format("%s-aks", var.name_prefix)
  vnet_name   = format("%s-vnet", var.name_prefix)
  fw_pip      = format("%s-pip", var.name_prefix)

}