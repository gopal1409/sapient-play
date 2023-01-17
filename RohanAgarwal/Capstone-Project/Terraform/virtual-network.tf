resource "azurerm_virtual_network" "capstone" {
  name                = "capstone-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.capstone.location
  resource_group_name = azurerm_resource_group.capstone.name
}