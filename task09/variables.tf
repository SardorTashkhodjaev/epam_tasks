variable "tags" {
  type        = map(string)
  description = "My tag with my name"
}

variable "name_prefix" {
  type        = string
  description = "Name prefix for other names"
}

variable "location" {
  type        = string
  description = "Location for RG"
}

variable "vnet_space" {
  type        = string
  description = "Existing Virtual Network Address Space"
}

variable "subnet_name" {
  type        = string
  description = "Existing Subnet name (AKS Cluster subnet)"
}


variable "subnet_space" {
  type        = string
  description = "Existing Subnet Address Space (AKS Cluster subnet):"
}

variable "aks_loadbalancer_ip" {
  type        = string
  description = "AKS load-balancer Public IP:"
}