
resource "azurerm_linux_virtual_machine" "main" {
  name                            = "${var.prefix}-vm"
  resource_group_name             = "resource-group-juan-gutierrez"
  location                        = "eastus"
  size                            = "Standard_D2s_v3"
  admin_username                  = "adminuser"
  admin_password                  = "Abc123"
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.main.id,
  ]

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }
   admin_ssh_key {
    username   = "adminuser"
    public_key = file("/home/devops1/.ssh/id_rsa.pub")  
  }


}