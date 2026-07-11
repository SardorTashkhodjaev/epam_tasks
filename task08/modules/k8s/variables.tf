variable "deployment_template" {
  type        = string
  description = "Path to deployment manifest template"
}

variable "secret_provider_template" {
  type        = string
  description = "Path to SecretProviderClass manifest template"
}

variable "service_manifest" {
  type        = string
  description = "Path to Kubernetes Service manifest"
}

variable "acr_login_server" {
  type        = string
  description = "Azure Container Registry login server"
}

variable "image_name" {
  type        = string
  description = "Application Docker image name"
}

variable "aks_kv_access_identity_id" {
  type        = string
  description = "User Assigned Identity client ID used by AKS to access Key Vault"
}

variable "kv_name" {
  type        = string
  description = "Azure Key Vault name"
}

variable "tenant_id" {
  type        = string
  description = "Azure Tenant ID"
}

variable "redis_url_secret_name" {
  type        = string
  description = "Key Vault secret name containing Redis hostname"
}

variable "redis_password_secret_name" {
  type        = string
  description = "Key Vault secret name containing Redis password"
}