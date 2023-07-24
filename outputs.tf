output "id" {
  value       = azurerm_linux_virtual_machine.this.id
  description = "The ID of the Linux Virtual Machine"
}

output "identity" {
  value       = var.identity_enabled ? azurerm_linux_virtual_machine.this.identity : [] #[0].principal_id : ""
  description = "linux virtual machine Identities list"
}

output "public_ip" {
  value = azurerm_public_ip.this[0].ip_address
  description = "Linux Virtual Machine public IP address"
}
