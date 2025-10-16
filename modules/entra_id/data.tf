data "azurerm_key_vault" "akv" {
  name                = "terraform-cred-1"
  resource_group_name = "resourcegroup"
}
data "azurerm_key_vault_secret" "devopsuser" {
  name         = "devopsuser-password"
  key_vault_id = data.azurerm_key_vault.akv.id
}
data "azurerm_key_vault_secret" "monitoringuser" {
  name         = "monitoringuser-password"
  key_vault_id = data.azurerm_key_vault.akv.id
}