resource "azuread_user" "devopsuser" {
  display_name        = "Devops User"
  user_principal_name = "devopsuser@heyboss238gmail.onmicrosoft.com"
  password            = data.azurerm_key_vault_secret.devopsuser.value
}
resource "azuread_user" "monitoringuser" {
  display_name        = "Monitoring User"
  user_principal_name = "monitoringuser@heyboss238gmail.onmicrosoft.com"
  password            = data.azurerm_key_vault_secret.monitoringuser.value
}
resource "azurerm_role_assignment" "devopsuser" {
  scope                = var.rg_id
  role_definition_name = "Contributor"
  principal_id         = azuread_user.devopsuser.object_id
}
resource "azurerm_role_assignment" "monitoringuser" {
  scope                = var.rg_id
  role_definition_name = "Reader"
  principal_id         = azuread_user.monitoringuser.object_id
}