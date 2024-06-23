resource "random_id" "storageaccount" {
  keepers = {
    # Generate a new id each time we switch to a new resource group
    group_name = azurerm_resource_group.rg.name
  }

  byte_length = 8
}

resource "azurerm_resource_group" "rg" {
  name     = "${var.prefix}backend"
  location = var.location

  tags = var.tags
}

resource "azurerm_storage_account" "tfsa" {
  name                     = "${var.prefix}state-${random_id.storageaccount.hex}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "tfsc" {
  name                  = "alpha"
  storage_account_name  = azurerm_storage_account.tfsa.name
  container_access_type = "private"
}

resource "azurerm_storage_blob" "tfblob" {
  name                   = "stateblob"
  storage_account_name   = azurerm_storage_account.tfsa.name
  storage_container_name = azurerm_storage_container.tfsc.name
  type                   = "Block"
}

