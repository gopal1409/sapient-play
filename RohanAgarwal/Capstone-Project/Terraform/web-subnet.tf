resource "azurerm_subnet" "capstone" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.capstone.name
  virtual_network_name = azurerm_virtual_network.capstone.name
  address_prefixes     = ["10.0.2.0/24"]
}