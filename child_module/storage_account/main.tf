resource "azurerm_storage_account" "stg1" {
    for_each = var.storage_account_gunjan
  name = each.value.name
  location = each.value.location
  resource_group_name = each.value.resource_group_name
  account_replication_type = each.value.account_replication_type
  account_tier = each.value.account_tier
}

resource "azurerm_storage_container" "example" {
  for_each = var.storage_account_gunjan
  

  name                  = each.value.container_name
  storage_account_id    = azurerm_storage_account.stg1[each.key].id
  container_access_type = "private"
}

