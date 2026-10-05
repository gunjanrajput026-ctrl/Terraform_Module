

module "resource_group" {
  source   = "../../child_module/resource_group"
  rgs = var.rg_group1
}

module "storage_account" {
  depends_on             = [module.resource_group]
  source                 = "../../child_module/storage_account"
  storage_account_gunjan = var.storage_account123

}

module "vnets" {
  depends_on = [module.resource_group]
  source     = "../../child_module/virtual_network"
  vnets      = var.virtual_network
}

module "snets" {
  depends_on = [module.vnets]
  source     = "../../child_module/subnets"
  subnets    = var.snets

}

module "public_ip" {
  depends_on = [module.resource_group]
  source     = "../../child_module/Public_ip"
  public_ips  = var.azurerm_public_ip

}
module "azurerm_virtual_machine" {
  depends_on = [module.resource_group, module.public_ip, module.snets]
  source     = "../../child_module/Virtual_machine"
  vms        = var.vms

}

# module "nat_public_ip" {

#   depends_on = [module.resource_group, module.snets]

#   source = "../../child_module/nat_public"

#   nat_public = var.nat
# }

module "nsg" {
  depends_on = [module.resource_group, module.snets]
  source     = "../../child_module/NSG"
  nsg1       = var.security

}

module "keyvault" {
  depends_on = [module.resource_group]
  source     = "../../child_module/Key_vault"
  keyvault   = var.keyvault
}

module "bastion" {
  depends_on = [module.resource_group, module.snets, module.public_ip]
  source     = "../../child_module/Bastion_Host"

  azurerm_bastion_host = var.azurerm_bastion_host
}