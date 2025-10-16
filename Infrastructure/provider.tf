terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.29.0"
    }

  }
}
provider "azurerm" {
  features {

  }
}

provider "azuread" {
  tenant_id     = data.azurerm_key_vault_secret.tenantid.value
  client_id     = data.azurerm_key_vault_secret.clientid.value
  client_secret = data.azurerm_key_vault_secret.clientsecret.value
}