
data "azurerm_subnet" "example" {
  for_each = var.azurerm_bastion_host

  name                 = each.value.subnet_name
  resource_group_name  = each.value.bastion_rg
  virtual_network_name = each.value.bastion_vnet

}
data "azurerm_public_ip" "example" {

  for_each = var.azurerm_bastion_host

  name                = each.value.bastion_public_ip_name
  resource_group_name = each.value.bastion_rg

}

resource "azurerm_bastion_host" "example" {
  for_each = var.azurerm_bastion_host

  name                = each.value.bastion_name
  location            = each.value.bastion_location
  resource_group_name = each.value.bastion_rg

  ip_configuration {
    name                 = each.value.bastion_ip_name
    subnet_id            = data.azurerm_subnet.example[each.key].id
    public_ip_address_id = data.azurerm_public_ip.example[each.key].id
  }
}