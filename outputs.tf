output "id" {
  value       = azurerm_linux_virtual_machine.this.id
  description = "The ID of the Linux Virtual Machine"
}

output "access_connector_identity" {
  value       = var.identity_enabled ? azurerm_linux_virtual_machine.this.identity[0].principal_id : ""
  description = "linux virtual machine Identities list"
}
