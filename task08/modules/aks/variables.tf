variable "aks_name" {
  type        = string
  description = "Azure Kubernetes Service (AKS) name"
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

variable "node_pool_name" {
  type        = string
  description = "Default AKS node pool name"
}

variable "node_count" {
  type        = number
  description = "Number of nodes in the default node pool"
}

variable "node_vm_size" {
  type        = string
  description = "Virtual machine size for the default node pool"
}

variable "os_disk_type" {
  type        = string
  description = "OS disk type for the default node pool"
}

variable "dns_prefix" {
  type        = string
  description = "DNS prefix for AKS"
}