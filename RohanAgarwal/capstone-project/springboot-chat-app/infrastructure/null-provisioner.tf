resource "null_resource" "null_copy_ssh_key_to_vm" {
  depends_on = [
    azurerm_linux_virtual_machine.webserver
  ]
  connection {
    type        = "ssh"
    host        = azurerm_linux_virtual_machine.webserver.public_ip_address
    user        = azurerm_linux_virtual_machine.webserver.admin_username
    private_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDHB+pb99E4re7hl6EgAPk8Y+6dy2OsaquJJxDiqlZRj/C7PN/XTM/AChyorQkZ2ZdKjoahrxyM2ySq0WAnabhGmLo8oInvaOpGMiH0IoNjr854JdkGSs8/HDcxPp6YvKZ0p6vzFKsFtLm6J6M3wWqePSln6Jl6LsEdOxeXKQpv25o1CfR9j3fVn3InD8t0hEjFjFcw48YncvLn0BJzEr7568Im0za5FOgHvrF6sjPa3DoYuOml3h6ldNqP8xwMR7/996zREDPxiQGmqiGXo5fgVNMx4o3AFXhddauByaRr/jx7zPW29+NTwAZEYzPsd/jG7/MhDJAQbZa7t9DnHK1jQ+iV/pfJxL9l5xctUbndd2eMcCzDt7WmCP8JN4FrJ3QROX8eNImt3+3hktXCUksV1kDJFFB46sKm6xEQKrem22sCVouWyPfNlhOymuWKp1TGUZLl+nhlC4bpnK8ZZbRlqIlQxxSqvDp0CbuXB8vx1u/jXlfomKBxKcaCCKUW/k0= root@ansiblemaster"
  }
  #file provisioiner which will upload my key
  provisioner "file" {
    source      = "/var/lib/jenkins/.ssh/id_rsa"
    destination = "/tmp/id_rsa"
  }
  provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "sudo chmod 400 /tmp/id_rsa",
      "chmod +x /tmp/script.sh",
      "/tmp/script.sh"
    ]
  }

}
