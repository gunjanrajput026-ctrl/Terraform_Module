

module "resource_group" {
    source = "../../child_module/resource_group"
    rg_group = var.rg_group1
 }

 module "storage_account" {
    depends_on = [ module.resource_group ]
    source = "../../child_module/storage_account"
    storage_account_gunjan = var.storage_account123
   
 }

 module "vnets" {
   depends_on = [ module.resource_group ]
   source = "../../child_module/virtual_network"
   vnets = var.virtual_network
}

module "snets" {
   depends_on = [ module.vnets ]
   source = "../../child_module/subnets"
   subnets = var.snets
  
}

module "public_ip" {
   depends_on = [ module.resource_group ]
   source = "../../child_module/Public_ip"
   public_ip = var.azurerm_public_ip
  
}