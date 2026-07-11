output "blob_url" {
  value       = azurerm_storage_blob.my_archive.url
  description = "BLOB url for further operations"
}

output "sas_token" {
  description = "SAS token for further operations"
  value       = data.azurerm_storage_account_blob_container_sas.sas.sas
}