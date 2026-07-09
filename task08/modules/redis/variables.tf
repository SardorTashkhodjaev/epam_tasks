variable "tags" {
  type        = map(string)
  description = "My tag with my name"
}


variable "location" {
  type        = string
  description = "Location for RG"
}

variable "rg_name" {
  type        = string
  description = "Name for RG"
}

variable "kv_id" {
  type        = string
  description = "Key Vault created ID"
}

variable "capacity" {
  type        = number
  description = "Azure Redis Cache Service (ARCS) capacity"
}

variable "sku" {
  type        = string
  description = "Azure Redis Cache Service (ARCS) sku"
}

variable "family" {
  type        = string
  description = "Azure Redis Cache Service (ARCS) fam"
}


variable "primary_key" {
  type        = string
  description = "Secret name for redis primary key"
}

variable "hostname" {
  type        = string
  description = "Secret name for redis hostname"
}

variable "name" {
  type        = string
  description = "Redis cache name"
}