output "web_linuxvm_private_ip_address" {
  description = "web linux vm private ip"
  value       = azurerm_linux_virtual_machine.webserver.private_ip_address
}

output "web_linuxvm_public_ip_address" {
  description = "web linux vm public ip"
  value       = azurerm_linux_virtual_machine.webserver.public_ip_address
}
