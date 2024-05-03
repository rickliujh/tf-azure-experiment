terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.100.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.6.1"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.29.0"
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

locals {
  kube_config = yamldecode(azurerm_kubernetes_cluster.tfk8salpha.kube_config_raw)
}

provider "azurerm" {
  features {}
}

provider "random" {}

provider "kubernetes" {
  host = local.kube_config.clusters[0].cluster.server

  client_key             = base64decode(local.kube_config.users[0].user.client-key-data)
  client_certificate     = base64decode(local.kube_config.users[0].user.client-certificate-data)
  cluster_ca_certificate = base64decode(local.kube_config.clusters[0].cluster.certificate-authority-data)
}

