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
  type = map(object({
    name = string
    sku_name = object({
      tier     = string
      size     = string
      capacity = number
    })
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
  type = list(object({
    name        = string
    priority    = number
    action      = string
    ip_address  = optional(string)
    service_tag = optional(string)
  }))
}


variable "tm" {
  type = string
}

variable "tm_method" {
  type = string
}


/* variable "app_service_plans" {
  type = map(object({
    name   = string
    worker = number
    sku_name = object({
      tier = string
      size = string
    })
  }))
} */

