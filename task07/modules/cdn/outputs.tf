output "endpoint_hostname" {
  description = "Endpoint hostname"
  value       = azurerm_cdn_frontdoor_endpoint.endpoint.host_name
}
/* output "sql_fqdn" {
  value       = azurerm_mssql_server.server.fully_qualified_domain_name
  description = "SQL server fully qualified domain name"
}

output "sql_connection_string" {
  description = "ADO.NET SQL connection string"

  value = format(
    "Server=tcp:%s,1433;Initial Catalog=%s;Persist Security Info=False;User ID=%s;Password=%s;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;",
    azurerm_mssql_server.server.fully_qualified_domain_name,
    azurerm_mssql_database.database.name,
    var.sql_admin_username,
    random_password.password.result
  )

  sensitive = true
}

 */