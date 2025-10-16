data "azurerm_key_vault" "akv" {
  name                = "terraform-cred-1"
  resource_group_name = "resourcegroup"
}
data "azurerm_key_vault_secret" "clientid" {
  name         = "clientid"
  key_vault_id = data.azurerm_key_vault.akv.id
}
data "azurerm_key_vault_secret" "clientsecret" {
  name         = "clientsecret"
  key_vault_id = data.azurerm_key_vault.akv.id
}
data "azurerm_key_vault_secret" "susbcriptionid" {
  name         = "susbcriptionid"
  key_vault_id = data.azurerm_key_vault.akv.id
}
data "azurerm_key_vault_secret" "tenantid" {
  name         = "tenantid"
  key_vault_id = data.azurerm_key_vault.akv.id
}
