variable "name" {
  type        = string
  description = "Windows web app name"
}

variable "location" {
  type        = string
  description = "Windows web app location"
}

variable "rg_name" {
  type        = string
  description = "Windows web app rg_name"
}
variable "asp_id" {
  type        = string
  description = "Windows web app asp_id"
}

variable "ip_restrictions" {
  type = list(object({
    name        = string
    priority    = number
    action      = string
    ip_address  = optional(string)
    service_tag = optional(string)
  }))
}

variable "tag" {
  type        = map(string)
  description = "My tag"
}