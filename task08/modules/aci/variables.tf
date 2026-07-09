variable "aci_name" {
  type        = string
  description = "Azure Container Instance name"
}

variable "location" {
  type        = string
  description = "Azure region where the Container Instance will be created"
}

variable "rg_name" {
  type        = string
  description = "Resource Group name"
}

variable "tags" {
  type        = map(string)
  description = "Tags applied to all resources"
}

variable "login_server" {
  type        = string
  description = "Azure Container Registry login server"
}

variable "admin_username" {
  type        = string
  description = "Azure Container Registry admin username"
}

variable "admin_password" {
  type        = string
  description = "Azure Container Registry admin password"
  sensitive   = true
}

variable "image_name" {
  type        = string
  description = "Docker image name stored in Azure Container Registry"
}

variable "redis_hostname" {
  type        = string
  description = "Azure Redis Cache hostname"
}

variable "redis_primary_key" {
  type        = string
  description = "Azure Redis Cache primary access key"
  sensitive   = true
}