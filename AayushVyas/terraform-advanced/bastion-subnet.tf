
resource "azurerm_subnet" "bastionsubnet" {
  name                 = "${local.resource_name_prefix}-${var.bastion_subnet_name}"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.bastion_subnet_address
}


resource "azurerm_network_security_group" "bastion_subnet_nsg" {
  name                = "${var.bastion_subnet_name}-nsg"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

#the top level nsg we will assoicate with subnet
resource "azurerm_subnet_network_security_group_association" "bastion_subnet_nsg_associate" {
    depends_on = [
      azurerm_network_security_rule.bastion_nsg_rule_inbound
    ]
  subnet_id                 = azurerm_subnet.bastionsubnet.id
  network_security_group_id = azurerm_network_security_group.bastion_subnet_nsg.id
}

resource "azurerm_network_security_rule" "bastion_nsg_rule_inbound" {
  
  name                        = "Rule-Port-3389"
  priority                    = 110
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = 3389
  source_address_prefix       = "172.174.169.31"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.bastion_subnet_nsg.name
}

resource "azurerm_network_security_rule" "bastion_nsg_rule_inbound_22" {
  
  name                        = "Rule-Port-22"
  priority                    = 120
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = 22
  source_address_prefix       = "172.174.169.31"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.bastion_subnet_nsg.name
}