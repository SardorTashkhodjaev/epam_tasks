variable "tags" {
  type        = map(string)
  description = "My tag with my name"
}


variable "location" {
  type        = string
  description = "Location for RG"
}

variable "name_prefix" {
  type        = string
  description = "Location for RG"
}

variable "aks_loadbalancer_ip" {
  type        = string
  description = "AKS load-balancer Public IP:"
}


variable "rg_name" {
  type        = string
  description = "RG name"
}

variable "vnet_name" {
  type        = string
  description = "VNET name"
}

variable "subnet_name" {
  type        = string
  description = "SUBNET name"
}

variable "fw_pip" {
  type        = string
  description = "Firewall public IP"
}