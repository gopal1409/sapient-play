resource "random_string" "myrandom" {
  length = 5
  upper = false 
  special = false
  numeric = false
}
resource "azurerm_public_ip" "capstone" {
  name                = "vm-publicip"
  location            = azurerm_resource_group.capstone.location
  resource_group_name = azurerm_resource_group.capstone.name
  allocation_method   = "Static"
  sku = "Standard"
  domain_name_label = "app1-vm-${random_string.myrandom.id}"
}