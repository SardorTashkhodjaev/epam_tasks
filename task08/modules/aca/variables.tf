variable "aca_name" {
  type        = string
  description = "Azure Container App name"
}

variable "aca_env_name" {
  type        = string
  description = "Azure Container App Environment name"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "rg_name" {
  type        = string
  description = "Resource Group name"
}

variable "tags" {
  type        = map(string)
  description = "Tags applied to resources"
}

variable "workload_profile_type" {
  type        = string
  description = "Container App workload profile type"
}

variable "login_server" {
  type        = string
  description = "Azure Container Registry login server"
}

variable "image_name" {
  type        = string
  description = "Docker image name"
}

variable "acr_id" {
  type        = string
  description = "Azure Container Registry ID"
}

variable "tenant_id" {
  type        = string
  description = "Azure Tenant ID"
}

variable "keyvault_id" {
  type        = string
  description = "Azure Key Vault ID"
}

variable "redis_hostname_secret_id" {
  type        = string
  description = "Key Vault Secret ID containing Redis hostname"
}

variable "redis_password_secret_id" {
  type        = string
  description = "Key Vault Secret ID containing Redis password"
}