variable "tags" {
  type        = map(string)
  description = "My tag with my name"
}

variable "sku" {
  type        = string
  description = "Azure Key Vault SKU"
}

variable "location" {
  type        = string
  description = "Location for RG"
}

variable "rg_name" {
  type        = string
  description = "Name for RG"
}

variable "kv_name" {
  type        = string
  description = "Key Vault name "
}