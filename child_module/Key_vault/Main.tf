data "azurerm_client_config" "current" {}



resource "azurerm_key_vault" "keyvault" {

  for_each = var.keyvault

  name                        = each.value.keyvaultname
  resource_group_name         = each.value.keyrg
  location                    = each.value.location
  rbac_authorization_enabled  = false
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"


}