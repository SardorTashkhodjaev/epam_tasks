locals {
  rg_name       = format("%s-rg", var.name_prefix)
  redis_aci_name      = format("%s-redis-ci", var.name_prefix)
  sa_name       = "${replace(var.name_prefix, "-", "")}sa"
  keyvault_name = format("%s-kv", var.name_prefix)
  acr_name      = "${replace(var.name_prefix, "-", "")}cr"
  docker_name   = format("%s-app", var.name_prefix)
  aca_env_name     = format("%s-cae", var.name_prefix)
  aca_name      = format("%s-ca", var.name_prefix)
  aks_name      = format("%s-aks", var.name_prefix)

}