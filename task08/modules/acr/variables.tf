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

variable "git_repo_url" {
  type        = string
  description = "Git repo URL"
  default     = "https://github.com/SardorTashkhodjaev/epam_tasks.git"

}

variable "git_pat" {
  type        = string
  description = "Token for access to GIT"
  sensitive   = true

}
variable "dockerfile_path" {
  type        = string
  description = "dockerfile_path in GIT repo"
  default     = "task08/application/Dockerfile"

}

variable "image_name" {
  type        = string
  description = "Docker image name"

}