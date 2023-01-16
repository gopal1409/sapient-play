resource "azurerm_virtual_network" "example" {
  name                = "example-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}

resource "azurerm_subnet" "example" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_public_ip" "host_public_ip" {
  name                = "vm-publicip"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  allocation_method   = "Static"
  sku = "Standard"
  #domain_name_label = "app1-vm-${random_string.myrandom.id}"
}

resource "azurerm_network_interface" "example" {
  name                = "example-nic"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.example.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.host_public_ip.id
  }
}

resource "azurerm_linux_virtual_machine" "example" {
  name                = "example-machine"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  size                = "Standard_D2s_v3"
  admin_username      = "adminuser"
  network_interface_ids = [
    azurerm_network_interface.example.id,
  ]

  admin_ssh_key {
    username   = "adminuser"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDHB+pb99E4re7hl6EgAPk8Y+6dy2OsaquJJxDiqlZRj/C7PN/XTM/AChyorQkZ2ZdKjoahrxyM2ySq0WAnabhGmLo8oInvaOpGMiH0IoNjr854JdkGSs8/HDcxPp6YvKZ0p6vzFKsFtLm6J6M3wWqePSln6Jl6LsEdOxeXKQpv25o1CfR9j3fVn3InD8t0hEjFjFcw48YncvLn0BJzEr7568Im0za5FOgHvrF6sjPa3DoYuOml3h6ldNqP8xwMR7/996zREDPxiQGmqiGXo5fgVNMx4o3AFXhddauByaRr/jx7zPW29+NTwAZEYzPsd/jG7/MhDJAQbZa7t9DnHK1jQ+iV/pfJxL9l5xctUbndd2eMcCzDt7WmCP8JN4FrJ3QROX8eNImt3+3hktXCUksV1kDJFFB46sKm6xEQKrem22sCVouWyPfNlhOymuWKp1TGUZLl+nhlC4bpnK8ZZbRlqIlQxxSqvDp0CbuXB8vx1u/jXlfomKBxKcaCCKUW/k0="
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts-gen2"
    version   = "20.04.202209200"
  }
}

