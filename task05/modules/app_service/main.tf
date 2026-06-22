resource "azurerm_windows_web_app" "APP" {
  name                = var.name
  location            = var.location
  resource_group_name = var.rg_name
  service_plan_id = var.asp_id
  tags = var.tag
  site_config {
    ip_restriction_default_action = "Deny"

    dynamic "ip_restriction" {
      for_each = var.ip_restrictions

      content {
        name = ip_restriction.value.name
        priority = ip_restriction.value.priority
        action = ip_restriction.value.action
        ip_address = try(ip_restriction.value.ip_address,null)
        service_tag = try(ip_restriction.value.service_tag, null)
      }
    }
  }

}
