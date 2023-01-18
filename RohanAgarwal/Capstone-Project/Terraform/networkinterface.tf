resource "azurerm_network_interface" "web_linuxvm_nic" {
   name                = "capstone-nic"
  location            = azurerm_resource_group.capstone.location
  resource_group_name = azurerm_resource_group.capstone.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.websubnet.id 
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.capstone.id
  }
}