variable "tags" {
  type        = map(string)
  description = "My tag with my name"
}

variable "name_prefix" {
  type        = string
  description = "Name prefix for other names"
}

variable "redis_capacity" {
  type        = number
  description = "Azure Redis Cache Service (ARCS) capacity"
}

variable "redis_sku" {
  type        = string
  description = "Azure Redis Cache Service (ARCS) sku"
}

variable "redis_sku_family" {
  type        = string
  description = "Azure Redis Cache Service (ARCS) fam"
}

variable "kv_sku" {
  type        = string
  description = "Azure Key Vault sku"
}

variable "redis_secret_pr_key" {
  type        = string
  description = "Secret name for redis primary key"
}

variable "redis_secret_hostname" {
  type        = string
  description = "Secret name for redis hostname"
}

variable "acr_sku" {
  type        = string
  description = "Azure Container Registry (ACR) sku"
}


variable "aci_sku" {
  type        = string
  description = "Azure Container Instance (ACI) sku"
}

variable "aks_np_name" {
  type        = string
  description = "Azure Kubernetes Service (AKS) Default node pool name"
}


variable "aks_np_ins_count" {
  type        = number
  description = "Default node pool instance count"
}


variable "aks_np_ins_node_size" {
  type        = string
  description = "Default node pool instance node size"
}


variable "aks_np_os" {
  type        = string
  description = "Default node pool os disk type"
}

variable "location" {
  type        = string
  description = "Location for RG"
}

variable "git_pat" {
  type        = string
  description = "GitHub Personal Access Token"
  sensitive   = true
}