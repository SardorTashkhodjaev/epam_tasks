output "aci_id" {
  description = "Azure Container Instance resource ID"
  value       = azurerm_container_group.aci.id
}

output "aci_ip_address" {
  description = "Public IP address of Azure Container Instance"
  value       = azurerm_container_group.aci.ip_address
}

output "aci_fqdn" {
  description = "Fully Qualified Domain Name of Azure Container Instance"
  value       = azurerm_container_group.aci.fqdn
}

output "fqdn" {
  value = azurerm_container_group.aci.fqdn
}