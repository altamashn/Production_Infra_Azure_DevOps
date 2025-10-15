output "application_subnet_id" {
  value = azurerm_subnet.subnet["application_subnet"].id
}