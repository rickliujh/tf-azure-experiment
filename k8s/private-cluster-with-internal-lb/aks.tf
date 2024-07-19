resource "azurerm_resource_group" "rg" {
  name     = "${var.prefix}k8s-ex-private-pls-internal-lb" # k8s for experiment
  location = var.location

  tags = var.tags
}

resource "azurerm_kubernetes_cluster" "tfk8salpha" {
  name                = "${var.prefix}k8s-private-pls-ilb"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "${var.prefix}k8s-alpha"
  private_cluster_enabled = true
  network_profile {
    network_plugin = "azure"
  }

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
    max_pods   = 250
  }

  identity {
    type = "SystemAssigned"
  }

  tags = var.tags
}

