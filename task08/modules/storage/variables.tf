variable "tags" {
  type        = map(string)
  description = "My tag with my name"
}

variable "rg_name" {
  type        = string
  description = "RG name"
}


variable "location" {
  type        = string
  description = "Location of the infrast"
}

variable "tier" {
  type        = string
  description = "account_tier of Storage"
  default     = "Standard"
}

variable "sa_repl_type" {
  type        = string
  description = "Account replication type"
}

variable "sa_access_type" {
  type        = string
  description = "Container access type"
}

variable "application_path" {
  type        = string
  description = "Application path"
}

variable "name" {
  type        = string
  description = "Application name"

}

variable "sa_cont_name" {
  type        = string
  description = "SA container name"
}