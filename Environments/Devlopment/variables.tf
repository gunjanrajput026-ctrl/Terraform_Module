variable "rg_group1" {}
variable "storage_account123" {}
variable "virtual_network" {}
# variable "snets" {}
variable "azurerm_public_ip" {

}

variable "snets" {
  type = map(object({
    name                 = string
    resource_group_name  = string
    virtual_network_name = string
    address_prefixes     = list(string)
    service_endpoints    = list(string) # 👈 ye line add karo
  }))
}
variable "vms" {}

variable "nat" {

}
variable "security" {

}

variable "keyvault" {

}
variable "azurerm_bastion_host" {

}