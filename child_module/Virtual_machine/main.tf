data "azurerm_subnet" "subnet" {
  for_each             = var.vms
  name                 = each.value.vm_subnet
  resource_group_name  = each.value.vm_rg
  virtual_network_name = each.value.vm_vnet

}

data "azurerm_public_ip" "pips" {
  for_each = var.vms

  name                = each.value.vm_pip
  resource_group_name = each.value.vm_rg


}

resource "azurerm_network_interface" "nic" {

  for_each            = var.vms
  name                = each.value.vm_nic
  location            = each.value.vm_loca
  resource_group_name = each.value.vm_rg

  ip_configuration {

    name = "internal"

    subnet_id                     = data.azurerm_subnet.subnet[each.key].id
    public_ip_address_id          = data.azurerm_public_ip.pips[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "example" {
   for_each = var.vms
  
  name                = each.value.vm_name
  resource_group_name = each.value.vm_rg
  location            = each.value.vm_loca
  size                = each.value.vm_size
  admin_username      = each.value.admin_username
  admin_password = each.value.admin_password
  disable_password_authentication = "false"
  network_interface_ids = [
    azurerm_network_interface.nic[each.key].id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }


    # Cloud-init script to install Nginx
  custom_data = base64encode(<<-EOF
              #!/bin/bash
              apt-get update -y
              apt-get install -y nginx
              systemctl enable nginx
              systemctl start nginx
              EOF
  )
}