variable "rg_name" {
  type        = string
  description = "Resource Group name"
}

variable "vnet_name" {
  type        = string
  description = "Virtual network name"
}

variable "subnet_name" {
  type        = string
  description = "Subnet 1 name"
}

variable "nic_name" {
  type        = string
  description = "Network interface name"
}

variable "nsg_name" {
  type        = string
  description = "NSG Name name"
}

variable "location" {
  type        = string
  description = "Where is located"
}

variable "tag" {
  type        = map(string)
  description = "My tag "

}

variable "pip_name" {
  type        = string
  description = "Public IP name"
}

variable "vm_name" {
  type        = string
  description = "VM name"
}

variable "dns_name" {
  type        = string
  description = "DNS name label"
}

variable "nsr_ssh" {
  type        = string
  description = "NSG inbound SSH rule"
}

variable "nsr_http" {
  type        = string
  description = "NSG inbound HTTP rule"
}

variable "vm_sku" {
  type        = string
  description = "VM SKU"
}

variable "vm_os" {
  type        = string
  description = "VM OS Version"
}

variable "vm_password" {
  type        = string
  sensitive   = true
  description = "VM password"
}