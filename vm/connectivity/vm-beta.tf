resource "azurerm_network_interface" "vmb" {
  name                = "${var.prefix}-vmbnic"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "ipvmb"
    subnet_id                     = azurerm_subnet.sn1.id
    private_ip_address_allocation = "Static"
    private_ip_address            = "10.0.2.50"
  }

  tags = var.tags
}

resource "azurerm_virtual_machine" "beta" {
  name                  = "${var.prefix}-vmb"
  location              = azurerm_resource_group.rg.location
  resource_group_name   = azurerm_resource_group.rg.name
  network_interface_ids = [azurerm_network_interface.vmb.id]
  vm_size               = var.vmsize

  # delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = true

  # delete the data disks automatically when deleting the VM
  delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = var.vmospub
    offer     = var.vmosoffer
    sku       = var.vmossku
    version   = var.vmosversion
  }
  storage_os_disk {
    name              = "osdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "vmb"
    admin_username = var.vmuser
    admin_password = var.vmpasswd
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }

  tags = var.tags
}

