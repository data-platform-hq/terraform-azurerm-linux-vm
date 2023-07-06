output "id" {
  value       = azurerm_linux_virtual_machine.this.id
  description = "The ID of the Linux Virtual Machine"
}

output "access_connector_identity" {
  value       = azurerm_linux_virtual_machine.this.identity[0].principal_id
  description = "linux virtual machine Identities list"
}

output "password" {
  value       = var.password_access_enable ? random_string.this[0].result : ""
  description = "The password of the Linux Virtual Machine"
}
