data "azurerm_public_ip" "external" {
  name                = azurerm_public_ip.external.name
  resource_group_name = "resource-group-juan-gutierrez"
}

output "public_ip_address" {
  value = data.azurerm_public_ip.external.ip_address
}