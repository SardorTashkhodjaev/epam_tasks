output "aks_id" {
  description = "Azure Kubernetes Service resource ID"
  value       = azurerm_kubernetes_cluster.aks.id
}

output "kube_config" {
  description = "Kubernetes configuration"
  value       = azurerm_kubernetes_cluster.aks.kube_config_raw
  sensitive   = true
}

output "kubelet_object_id" {
  description = "AKS kubelet managed identity object ID"
  value       = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
}