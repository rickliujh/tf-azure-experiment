terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
            version = "3.100.0"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
  client_id       = var.sp.app_id
  client_secret   = var.sp.password
  subscription_id = var.sp.subscription_id
}

resource "azurerm_resource_group" "rg" {
  name     = "myTFResourceGroup"
  location = "eastus"
}
