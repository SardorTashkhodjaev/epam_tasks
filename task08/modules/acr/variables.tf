variable "tags" {
  type        = map(string)
  description = "My tag with my name"
}

variable "sku" {
  type        = string
  description = "Azure Container Registry (ACR) sku"
}

variable "location" {
  type        = string
  description = "Location for RG"
}

variable "rg_name" {
  type        = string
  description = "Name for RG"
}

variable "acr_name" {
  type        = string
  description = "Name for ACR"
}

variable "task_name" {
  type        = string
  description = "Task name for ACR"
  default     = "my_task"
}

variable "dockerfile_path" {
  type        = string
  description = "dockerfile_path in GIT repo"
  default     = "Dockerfile"

}

variable "image_name" {
  type        = string
  description = "Docker image name"

}

variable "blob_url" {
  type        = string
  description = "URL of application archive in Storage Account"
}

variable "sas_token" {
  type        = string
  description = "SAS token for Storage Account blob"
  sensitive   = true
}