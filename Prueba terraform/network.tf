resource "azurerm_virtual_network" "main" {
  name                = "${var.prefix}-network"
  address_space       = ["10.0.0.0/22"]
  location            = var.location
  resource_group_name = "resource-group-juan-gutierrez"
}

resource "azurerm_subnet" "internal" {
  name                 = "internal"
  resource_group_name  = "resource-group-juan-gutierrez"
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_public_ip" "external" {
  name                = "external-public-ip"
  location            = var.location
  resource_group_name = "resource-group-juan-gutierrez"
  allocation_method   = "Dynamic"
  idle_timeout_in_minutes = 30
}

resource "azurerm_network_interface" "main" {
  name                = "${var.prefix}-nic"
  resource_group_name = "resource-group-juan-gutierrez"
  location            = var.location


  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.internal.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.external.id
  }
}