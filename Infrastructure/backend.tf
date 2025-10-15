terraform {
  backend "azurerm" {
    resource_group_name  = "resourcegroup"
    storage_account_name = "terraformstatealtamash"
    container_name       = "production-infra"
    key                  = "prod.tfstate"
  }
}