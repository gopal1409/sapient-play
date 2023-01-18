resource "azurerm_kubernetes_cluster" "capstone" {
  name                = "capstone-aks1"
  location            = azurerm_resource_group.capstone.location
  resource_group_name = azurerm_resource_group.capstone.name
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

