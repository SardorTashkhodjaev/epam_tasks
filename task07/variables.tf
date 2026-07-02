variable "location" {
  type        = string
  description = "Location of resources"
}

variable "name_prefix" {
  type        = string
  description = "Name prefix for resources"
}

variable "resource_group_id" {
  type        = string
  description = "Resource Group ID"
}

variable "storage_account_name" {
  type        = string
  description = "Storage Account name"
}

variable "storage_account_id" {
  type        = string
  description = "Storage account ID"
}

/* variable "filename_in_storage_account" {
  type        = string
  description = "Filename in Storage Account"
} */

variable "cdn_fd_sku" {
  type        = string
  description = "CDN Front Door profile SKU"
}

variable "cdn_fd_route_name" {
  type        = string
  description = "CDN Front Door route name:"
}

variable "tag" {
  type        = map(string)
  description = "My tag with name"
}

