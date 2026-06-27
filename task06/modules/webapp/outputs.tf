output "hostname" {
  value       = azurerm_linux_web_app.example.default_hostname
  description = "Linux Web App hostname"
}
