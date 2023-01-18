resource "azurerm_network_security_group" "nsg" {
  name                = "nsg"
  location            = var.region
  resource_group_name = azurerm_resource_group.capstone.name

}

resource "azurerm_network_interface_security_group_association" "example" {
  network_interface_id      = azurerm_network_interface.web_linuxvm_nic.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}