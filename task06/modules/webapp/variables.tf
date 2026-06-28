variable "asp_name" {
  type        = string
  description = "Name of the ASP"
}

variable "web_app_name" {
  type        = string
  description = "Name web application"
}

variable "location" {
  type        = string
  description = "Location"
}

variable "rg_name" {
  type        = string
  description = "RG name"
}

variable "os" {
  type        = string
  description = "OS"
}

variable "sku" {
  type        = string
  description = "SKU"
}

variable "dotnet" {
  type        = string
  description = "Dotnet version"
}


variable "tag" {
  type        = map(string)
  description = "my tag"
}

variable "sql_connection_string" {
  description = "SQL Database connection string"
  type        = string
  sensitive   = true
}