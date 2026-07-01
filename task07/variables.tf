variable "location" {
  type = string
  default = "Location of resources"
}

variable "name_prefix" {
  type = string
  default = "Name prefix for resources"
}

variable "resource_group_id" {
  type = string
  default = "Resource Group ID"
}

variable "storage_account_name" {
  type = string
  default = "Storage Account name"
}

variable "storage_account_id" {
  type = string
  default = "Storage account ID"
}

variable "filename_in_storage_account" {
  type = string
  default = "Filename in Storage Account"
}

variable "cdn_fd_sku" {
  type = string
  default = "CDN Front Door profile SKU"
}

variable "cdn_fd_route_name" {
  type = string
  default = "CDN Front Door route name:"
}

variable "tag" {
  type = map(string)
  description = "My tag with name"
}