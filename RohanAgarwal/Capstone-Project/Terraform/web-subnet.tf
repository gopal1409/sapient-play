resource "azurerm_subnet" "websubnet" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.capstone.name
  virtual_network_name = azurerm_virtual_network.capstone.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_security_group" "nsg" {
  name                = "nsg"
  location            = azurerm_resource_group.capstone.location
  resource_group_name = azurerm_resource_group.capstone.name
}

resource "azurerm_subnet_network_security_group_association" "nsg_associate" {
    depends_on = [
      azurerm_network_security_rule.web_nsg_rule_inbound
    ]
  subnet_id                 = azurerm_subnet.websubnet.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}
locals {
  web_inbound_port = {
  "110":"80",
  "120":"443",
  "130": "22"
  }
 
}
resource "azurerm_network_security_rule" "web_nsg_rule_inbound" {
  for_each = local.web_inbound_port
  name                        = "Rule-Port-${each.value}"
  priority                    = each.key
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = each.value
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.capstone.name
  network_security_group_name = azurerm_network_security_group.nsg.name
}
