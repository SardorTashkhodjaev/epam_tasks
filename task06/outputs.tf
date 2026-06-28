output "sql_server_fqdn" {
  value       = module.sql.sql_fqdn
  description = "fully_qualified_domain_name"
}


output "app_hostname" {
  value       = module.webapp.linux_hostname
  description = "Linux Web App hostname"
}


