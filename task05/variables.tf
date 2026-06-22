variable "resource_groups" {
  type = map(object({
    name     = string
    location = string
  }))
  description = "A map of resource group objects"
}

variable "tag" {
  type        = map(string)
  description = "My tag"
}

variable "app_service_plans" {
  description = "something something"
  type = map(object({
    name     = string
    sku_name = string
    os       = string
  }))

}


variable "app1_name" {
  type        = string
  description = "App1_name"
}

variable "app2_name" {
  type        = string
  description = "App2_name"
}

variable "ip_restriction" {
  description = "something something"
  type = list(object({
    name        = string
    priority    = number
    action      = string
    ip_address  = optional(string)
    service_tag = optional(string)
  }))
}


variable "tm" {
  description = "something something"
  type        = string
}

variable "tm_method" {
  description = "something something"
  type        = string
}

variable "tm_dns_name" {
  type        = string
  description = "dns_name"
}

variable "tm_endpoints" {
  description = "endpoints"
  type = map(object({
    name = string
    #target_resource_id = string
    weight = number
  }))
}