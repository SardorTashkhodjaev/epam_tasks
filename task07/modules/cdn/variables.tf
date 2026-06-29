variable "tag" {
  type        = map(string)
  description = "My tag with name"
}

variable "server_name" {
  type        = string
  description = "Server name"
}

variable "rg_name" {
  type        = string
  description = "Resource Group name"
}

variable "location" {
  type        = string
  description = "Location of instances"
}

variable "db_name" {
  type        = string
  description = "Data Base name"
}

variable "sku" {
  type        = string
  description = "Data Base sku"
}

variable "allowed_ip_address" {
  type        = string
  description = "accepted IP"

}

variable "sql_admin_username" {
  type        = string
  description = "Login for admin"

}

variable "sq_fw_rule" {
  type        = string
  description = "sq_fw_rule_name"
}

variable "kv_name" {
  type        = string
  description = "Existing KV"
}


variable "kv_rg" {
  type        = string
  description = "Existing KV Resource Group"
}

variable "kv_admin_name" {
  type        = string
  description = "kv_admin_name"
}

variable "kv_admin_pass" {
  type        = string
  description = "kv_admin_pass"
}
