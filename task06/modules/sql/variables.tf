variable "tag" {
  type        = map(string)
  description = "My tag"
}

variable "server_name" {
  type        = string
  description = "Server name"
}

variable "rg_name" {
  type        = string
  description = "RG name"
}

variable "location" {
  type        = string
  description = "Location"
}

variable "db_name" {
  type        = string
  description = "DB name"
}

variable "sku" {
  type        = string
  description = "DB sku"
}