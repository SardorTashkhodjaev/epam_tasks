variable "name" {
  type        = string
  description = "Name of the ASP"
}

variable "location" {
  type        = string
  description = "Location of the ASP"
}

variable "rg_name" {
  type        = string
  description = "RG name of the ASP"
}
variable "tag" {
  type        = map(string)
  description = "My tag "
}

variable "sku_name" {
  type        = string
  description = "sku_name"
}

variable "os" {
  type        = string
  description = "os_name"
}

/* variable "sku" {
  description = "something something"
  type = object({
    tier     = string
    size     = string
    capacity = number

  })

} */

/* variable "worker_count" {  
  type = number
  description = "Numer of workers"
} */