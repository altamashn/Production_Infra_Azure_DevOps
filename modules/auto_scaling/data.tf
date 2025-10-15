data "azurerm_key_vault" "akv" {
  name                = "terraform-cred-1"
  resource_group_name = "resourcegroup"
}

data "azurerm_key_vault_secret" "notificationemail" {
  name         = "notificationemail"
  key_vault_id = data.azurerm_key_vault.akv.id
}