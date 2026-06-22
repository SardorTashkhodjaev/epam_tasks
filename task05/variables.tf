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

