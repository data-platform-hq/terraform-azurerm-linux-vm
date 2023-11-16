output "id" {
  value       = azurerm_linux_virtual_machine.this.id
  description = "The ID of the Linux Virtual Machine"
}

output "identity" {
  value       = try(azurerm_linux_virtual_machine.this.identity, [])
  description = "linux virtual machine Identities list"
}

output "public_ip" {
  value       = try(azurerm_public_ip.this[0].ip_address, null)
  description = "Linux Virtual Machine public IP address"
}

output "private_ip" {
  value       = try(azurerm_linux_virtual_machine.this.private_ip_address, null)
  description = "Linux Virtual Machine private IP address"
}

output "private_ip_second_nic" {
  value       = try(azurerm_network_interface.second[0].private_ip_address, null)
  description = "Linux Virtual Machine second nic private IP address"
}
