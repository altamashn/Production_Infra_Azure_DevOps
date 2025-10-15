data "azurerm_key_vault" "akv" {
  name                = "terraform-cred-1"
  resource_group_name = "resourcegroup"
}
data "azurerm_key_vault_secret" "akvs" {
  name         = "linux-username"
  key_vault_id = data.azurerm_key_vault.akv.id
}
data "azurerm_key_vault_secret" "vmss-password" {
  name         = "vmss-password"
  key_vault_id = data.azurerm_key_vault.akv.id
}