variable "name" {
  description = "Name of TM"
  type        = string
}

variable "tm_method" {
  description = "TM method"
  type        = string
}

variable "rg_name" {
  description = "RG name"
  type        = string
}

/* variable "wsp_name" {
  description = "wsp_name"
  type = string
} */

variable "tag" {
  type        = map(string)
  description = "tag"

}

variable "endpoints" {
  description = "endpoints"
  type = map(object({
    name               = string
    target_resource_id = string
    weight             = number
  }))
}

variable "dns_name" {
  type        = string
  description = "dns_name"
}
