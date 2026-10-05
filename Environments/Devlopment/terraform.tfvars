rg_group1 = {
  rg1 = {
    name     = "Gunjan-dev"
    location = "eastus2"
  }
 rg2 = {
    name     = "Gunjan-pro"
    location = "eastus2"
  }}
storage_account123 = {
  stg1 = {
    name                     = "gunjanstorage009191"
    location                 = "eastus2"
    resource_group_name      = "Gunjan-dev"
    account_replication_type = "LRS"
    account_tier             = "Standard"
    container_name           = "gunjancontainer"
  }
  stg2 = {
    name                     = "gunjanstorage0092921"
    location                 = "eastus2"
    resource_group_name      = "Gunjan-dev"
    account_replication_type = "LRS"
    account_tier             = "Standard"
    container_name           = "gunjancontainer1"

  }

}
virtual_network = {
  vnet1 = {
    name                = "Gunjan-vnet1"
    location            = "eastus2"
    resource_group_name = "Gunjan-dev"
    address_space       = ["100.0.0.0/16"]
  }
}


snets = {
  subnet1 = {
    name                 = "frontend-subnets"
    resource_group_name  = "Gunjan-dev"
    virtual_network_name = "Gunjan-vnet1"
    address_prefixes     = ["100.0.1.0/24"]
    service_endpoints    = ["Microsoft.storage"]
  }
  subnet2 = {
    name                 = "backend-subnets"
    resource_group_name  = "Gunjan-dev"
    virtual_network_name = "Gunjan-vnet1"
    address_prefixes     = ["100.0.2.0/24"]
    service_endpoints    = []
  }
  subnet3 = {
    name                 = "AzureBastionsubnet"
    resource_group_name  = "Gunjan-dev"
    virtual_network_name = "Gunjan-vnet1"
    address_prefixes     = ["100.0.3.0/26"]
    service_endpoints    = []
  }
}

azurerm_public_ip = {
  pip1 = {
    name                = "Gunjan-PIP"
    location            = "eastus2"
    resource_group_name = "Gunjan-dev"
    allocation_method   = "Static"
  }
  pip2 = {
    name                = "Gunjan-PIP1"
    location            = "eastus2"
    resource_group_name = "Gunjan-dev"
    allocation_method   = "Static"
  }
    pip3 = {
    name                = "Gunjan-PIP2"
    location            = "eastus2"
    resource_group_name = "Gunjan-dev"
    allocation_method   = "Static"
  }
}

vms = {
  vm1 = {
    vm_subnet      = "frontend-subnets"
    vm_rg          = "Gunjan-dev"
    vm_vnet        = "Gunjan-vnet1"
    vm_pip         = "Gunjan-PIP"
    vm_nic         = "frontend_vm_nic"
    vm_loca        = "eastus2"
    vm_name        = "Gunjanvm111"
    admin_username = "Gunjanvm1"
    admin_password = "Gunjan@9006"
    vm_size        = "Standard_D2s_v3"

  }
  vm2 = {
    vm_subnet      = "backend-subnets"
    vm_rg          = "Gunjan-dev"
    vm_vnet        = "Gunjan-vnet1"
    vm_pip         = "Gunjan-PIP1"
    vm_nic         = "backend_vm_nic"
    vm_loca        = "eastus2"
    vm_name        = "Gunjanvm123"
    admin_username = "Gunjanvm1"
    admin_password = "Gunjan@9006"
    vm_size        = "Standard_D2s_v3"
    


  }
}

nat = {
  nat1 = {
    nat_public_ip = "Gunjan-nat-pip"
    nat_location  = "eastus2"
    nat_name      = "Gunjan_nat"
    nat_rg_name   = "Gunjan-dev"
    nat_subnet    = "frontend-subnets"
    nat_vnet      = "Gunjan-vnet1"

  }
}

security = {
  nsg11 = {
    nsg_name             = "gunjan-nsg1"
    location             = "eastus2"
    nsg_name             = "Gunjan-dev"
    subnets_name         = "frontend-subnets"
    resource_group_name  = "Gunjan-dev"
    virtual_network_name = "Gunjan-vnet1"
  }
  nsg12 = {
    nsg_name             = "gunjan-nsg1"
    location             = "eastus2"
    nsg_name             = "Gunjan-dev"
    subnets_name         = "backend-subnets"
    resource_group_name  = "Gunjan-dev"
    virtual_network_name = "Gunjan-vnet1"
  }
}

keyvault = {
  key = {
    keyvaultname = "Gunjankey"
    keyrg        = "Gunjan-Dev"
    location     = "eastus2"
  }
}
azurerm_bastion_host = {
  bas1 = {
    subnet_name            = "AzureBastionSubnet"
    bastion_rg             = "Gunjan-dev"
    bastion_vnet           = "Gunjan-vnet1"
    bastion_public_ip_name = "Gunjan-PIP2"
    bastion_name           = "Gunjan-bastion"
    bastion_location       = "eastus2"
    bastion_ip_name        = "Gunjan-bastion-ip-name"

  }
}