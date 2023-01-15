resource "azurerm_resource_group" "aks-resource" {
  name     = "aks_resourceks"
  location = "eastus"
  tags = {
    Environment = "Capstone"
  }
}

resource "azurerm_kubernetes_cluster" "aks-cluster" {
  name                = "aks_clusters"
  location            = azurerm_resource_group.aks-resource.location
  resource_group_name = azurerm_resource_group.aks-resource.name
  dns_prefix          = "aks"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2s_v3"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Capstone"
  }
}

