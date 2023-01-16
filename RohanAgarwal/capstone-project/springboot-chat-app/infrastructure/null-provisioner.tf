resource "null_resource" "null_copy_ssh_key_to_vm" {
  depends_on = [
    azurerm_linux_virtual_machine.webserver
  ]
  connection {
    type        = "ssh"
    host        = azurerm_linux_virtual_machine.webserver.public_ip_address
    user        = azurerm_linux_virtual_machine.webserver.admin_username
    private_key = file(".ssh/id_rsa")
  }
  
  provisioner "file" {
    source      = ".ssh/id_rsa"
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
