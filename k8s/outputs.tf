output "resource_group_id" {
  value = azurerm_resource_group.rg.id
}

output "client_certificate" {
  value     = azurerm_kubernetes_cluster.tfk8salpha.kube_config[0].client_certificate
  sensitive = true
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.tfk8salpha.kube_config_raw

  sensitive = true
}
