output "aks_id" {
  description = "Azure Kubernetes Service resource ID"
  value       = azurerm_kubernetes_cluster.aks.id
}


output "kubelet_object_id" {
  description = "AKS kubelet managed identity object ID"
  value       = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
}

output "key_vault_secret_identity_object_id" {
  description = "Object ID of the Key Vault Secrets Provider identity"

  value = azurerm_kubernetes_cluster.aks.key_vault_secrets_provider[0].secret_identity[0].object_id
}

output "host" {
  value       = azurerm_kubernetes_cluster.aks.kube_config[0].host
  description = "For K8S deployment"
}

output "client_certificate" {
  value       = azurerm_kubernetes_cluster.aks.kube_config[0].client_certificate
  sensitive   = true
  description = "For K8S deployment"
}

output "client_key" {
  value       = azurerm_kubernetes_cluster.aks.kube_config[0].client_key
  sensitive   = true
  description = "For K8S deployment"
}

output "cluster_ca_certificate" {
  value       = azurerm_kubernetes_cluster.aks.kube_config[0].cluster_ca_certificate
  sensitive   = true
  description = "For K8S deployment"
}

output "key_vault_secret_identity_client_id" {
  description = "Client ID of the Key Vault Secrets Provider identity"
  value       = azurerm_kubernetes_cluster.aks.key_vault_secrets_provider[0].secret_identity[0].client_id
}