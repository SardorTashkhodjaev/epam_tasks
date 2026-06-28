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
  description = "Location of instances"
}

variable "rg_name" {
  type        = string
  description = "Resource Group name"
}

variable "os" {
  type        = string
  description = "OS for instance"
}

variable "sku" {
  type        = string
  description = "SKU type"
}

variable "dotnet" {
  type        = string
  description = "Dotnet version"
}


variable "tag" {
  type        = map(string)
  description = "my tag with name"
}

variable "sql_connection_string" {
  description = "SQL Database connection string"
  type        = string
  sensitive   = true
}