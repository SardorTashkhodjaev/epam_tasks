variable "location" {
  type        = string
  description = "Location of resources"
}

variable "name_identity" {
  type        = string
  description = "name of the identity"
  default     = "my_identity"
}

variable "rg_name" {
  type        = string
  description = "Resource Group name"
}

variable "fd_name" {
  type        = string
  description = "Front door name"
}

variable "sku" {
  type        = string
  description = "name of the SKU"
}


variable "tag" {
  type        = map(string)
  description = "My tag with name"
}

variable "endpoint_name" {
  type        = string
  description = "name of the endpoint"
}

variable "or_gr_name" {
  type        = string
  description = "Origin group name"
}

variable "fd_origin_name" {
  type        = string
  description = "Front door origin name"
}

variable "fd_route_name" {
  type        = string
  description = "Front Door route name"
}

variable "primary_blob_host" {
  type        = string
  description = "primary_blob_host from storage"
}
