terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.80.0"
    }
  }
  #   backend "azurerm" {
  #   resource_group_name = "Gunjan-dev"
  #   storage_account_name = "gunjanstorage009"
  #   container_name = "gunjancontainer"
  #   key = "mytfstate"


  # }

}
provider "azurerm" {
  features {}

}

# backend "azurerm" {
#   resource_group_name = "Gunjan-dev"
#   storage_account_name = "gunjanstorage009"
#   container_name = "gunjancontainer"
#   key = "mytfstate"


# }