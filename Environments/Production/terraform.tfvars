rg_group1 = {
    rg1 = {
        name = "Gunjan-Prod"
        location = "eastus2"
    }
}
storage_account123 = {
    stg1 = {
        name = "gunjanstorageprod"
        location = "eastus2"
        resource_group_name = "Gunjan-Prod"
        account_replication_type = "LRS"
        account_tier = "Standard"
    }
}
virtual_network = {
    vnet1 = {
        name = "Gunjan-prod-vnet1"
        location = "eastus2"
        resource_group_name = "Gunjan-Prod"
        address_space = ["100.0.0.0/16"]
    }
}


snets = {
    subnet1 = {
        name = "frontend-subnets1"
        resource_group_name = "Gunjan-Prod"
        virtual_network_name = "Gunjan-prod-vnet1"
        address_prefixes = ["100.0.1.0/24"]
    }
     subnet2 = {
        name = "backend-subnets1"
        resource_group_name = "Gunjan-Prod"
        virtual_network_name = "Gunjan-prod-vnet1"
        address_prefixes = ["100.0.2.0/24"]
    }
      subnet3 = {
        name = "AzureBastionsubnet"
        resource_group_name = "Gunjan-Prod"
        virtual_network_name = "Gunjan-prod-vnet1"
        address_prefixes = ["100.0.3.0/26"]
    }
}

azurerm_public_ip = {
    pip1 = {
        name ="Gunjan-prod-PIP"
        location = "eastus2"
        resource_group_name = "Gunjan-Prod"
        allocation_method = "Static"
    }
}