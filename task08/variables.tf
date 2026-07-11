variable "tags" {
  type        = map(string)
  description = "My tag with my name"
}

variable "name_prefix" {
  type        = string
  description = "Name prefix for other names"
}

variable "redis_sku" {
  type        = string
  description = "Azure Redis Cache Service (ARCS) sku"
}

variable "sa_repl_type" {
  type        = string
  description = "Account replication type"
}

variable "sa_cont_name" {
  type        = string
  description = "Container name"
}

variable "sa_access_type" {
  type        = string
  description = "Container name"
}

variable "kv_sku" {
  type        = string
  description = "Azure Key Vault sku"
}
variable "redis_secret_pass" {
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


variable "aca_type" {
  type        = string
  description = "Azure Container App (ACA) Workload profile type"
}

variable "acae_type" {
  type        = string
  description = "Azure Container App Environment (ACAE) Workload profile type"
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
