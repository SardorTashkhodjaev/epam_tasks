variable "name_prefix" {
  type        = string
  description = "Name prefix for all var"

}

variable "location" {
  type        = string
  description = "Location of the instances"
}

variable "ex_kv_rg_name" {
  type        = string
  description = "Existing Key Vault Resource group name"
}

variable "ex_kv_name" {
  type        = string
  description = "Existing Key Vault Name"
}

variable "kv_sql_admin_name" {
  type        = string
  description = "Key Vault Secret name for SQL admin name"

}

variable "kv_sql_admin_pass" {
  type        = string
  description = "Key Vault Secret name for SQL admin password"
}

variable "sql_model" {
  type        = string
  description = "SQL Database service model"
}

variable "sql_fw_rule_name" {
  type        = string
  description = "SQL Server Firewall Rule name"
}

variable "asp_sku" {
  type        = string
  description = "App Service PLan SKU"
}

variable "asp_os" {
  type        = string
  description = "App Service PLan OS"
}

variable "dotnet_vers" {
  type        = string
  description = "Web Application dotnet version"
}

variable "tag" {
  type        = map(string)
  description = "My tag with name"
}



variable "allowed_ip_address" {
  type        = string
  description = "accepted IP"

}

variable "sql_admin_username" {
  type        = string
  description = "Login for admin"

}