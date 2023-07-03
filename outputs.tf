output "id" {
  #value       = [for n in databricks_sql_endpoint.this : n.jdbc_url]
  value       = azurerm_linux_virtual_machine.this.id
  description = "The ID of the Linux Virtual Machine"
}

