resource "azurerm_linux_virtual_machine" "example" {

  name                = "${var.web_subnet_name}-web-linuxvm"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  size                = "Standard_D2s_v3"
  admin_username      = "azureuser"
  network_interface_ids = [
    azurerm_network_interface.web_linuxvm_nic.id,
  ]

  admin_ssh_key {
    username   = "azureuser"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDHB+pb99E4re7hl6EgAPk8Y+6dy2OsaquJJxDiqlZRj/C7PN/XTM/AChyorQkZ2ZdKjoahrxyM2ySq0WAnabhGmLo8oInvaOpGMiH0IoNjr854JdkGSs8/HDcxPp6YvKZ0p6vzFKsFtLm6J6M3wWqePSln6Jl6LsEdOxeXKQpv25o1CfR9j3fVn3InD8t0hEjFjFcw48YncvLn0BJzEr7568Im0za5FOgHvrF6sjPa3DoYuOml3h6ldNqP8xwMR7/996zREDPxiQGmqiGXo5fgVNMx4o3AFXhddauByaRr/jx7zPW29+NTwAZEYzPsd/jG7/MhDJAQbZa7t9DnHK1jQ+iV/pfJxL9l5xctUbndd2eMcCzDt7WmCP8JN4FrJ3QROX8eNImt3+3hktXCUksV1kDJFFB46sKm6xEQKrem22sCVouWyPfNlhOymuWKp1TGUZLl+nhlC4bpnK8ZZbRlqIlQxxSqvDp0CbuXB8vx1u/jXlfomKBxKcaCCKUW/k0= root@ansiblemaster"
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    offer                 = "0001-com-ubuntu-server-focal"
    publisher             = "Canonical"
    sku                   = "20_04-lts-gen2"
    version   = "latest"
  }
}