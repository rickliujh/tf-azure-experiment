terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.100.0"
    }
  }

  required_version = ">= 1.1.0"

  backend "azurerm" {
    resource_group_name  = "tf_backend"        # Can be passed via `-backend-config=`"resource_group_name=<resource group name>"` in the `init` command.
    storage_account_name = "tfstate57345"      # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
    container_name       = "alpha"             # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
    key                  = "terraform.tfstate" # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
  }
}

provider "azurerm" {
  features {}
  client_id       = var.sp.app_id
  client_secret   = var.sp.password
  subscription_id = var.sp.subscription_id
  tenant_id       = var.sp.tenant
}

resource "azurerm_resource_group" "rg" {
  name     = "${var.prefix}eus_1"
  location = var.location

  tags = var.tags
}

resource "azurerm_virtual_network" "vnet" {
  name                = "${var.prefix}vnet"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name

  tags = var.tags
}

