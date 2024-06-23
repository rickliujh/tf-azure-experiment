output "resource_group_id" {
  value = azurerm_resource_group.rg.id
}

output "storage_account_name" {
  value     = azurerm_storage_account.tfsa.name
}

output "storage_container_name" {
  value     = azurerm_storage_container.tfsc.name
}

output "storage_blob_name" {
  value     = azurerm_storage_blob.tfblob.name
}

output "storage_account_key" {
  value     = azurerm_storage_account.tfsa.primary_access_key
  sensitive = true 
}

