variable "aci_name" {
  type        = string
  description = "Azure Container Instance name"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "rg_name" {
  type        = string
  description = "Resource Group name"
}

variable "keyvault_id" {
  type        = string
  description = "Azure Key Vault ID"
}

variable "redis_hostname_secret_name" {
  type        = string
  description = "Key Vault secret name for Redis hostname"
}

variable "redis_password_secret_name" {
  type        = string
  description = "Key Vault secret name for Redis password"
}

variable "tags" {
  type        = map(string)
  description = "Tags applied to resources"
}