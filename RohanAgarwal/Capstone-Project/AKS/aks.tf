resource "azurerm_kubernetes_cluster" "capstone" {
  name                = "capstone-aks1"
  location            = "eastus"
  resource_group_name = "capstone-resources"
  dns_prefix          = "capstoneaks1"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
  }
}

