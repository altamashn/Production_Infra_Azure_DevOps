module "resource_group" {
  source   = "../modules/resource_group"
  rg_name  = var.rg_name
  location = var.location
  tags     = local.common_tags
}
module "network" {
  source             = "../modules/network"
  vnet_name          = var.vnet_name
  vnet_address_space = var.vnet_address_space
  subnets            = var.subnets
  rg_name            = module.resource_group.rg_name
  location           = module.resource_group.location
  nsg_name           = var.nsg_name
  security_rules     = var.security_rules
  tags               = local.common_tags
}
module "lb" {
  source                    = "../modules/load_balancer"
  lb-name                   = var.lb-name
  lb-pip-name               = var.lb-pip-name
  rg_name                   = module.resource_group.rg_name
  location                  = module.resource_group.location
  pip-allocation_method     = var.pip-allocation_method
  backend-address-pool-name = var.backend-address-pool-name
  pip-sku                   = var.pip-sku
  subnet_id                 = module.network.application_subnet_id
  lb-nat-rule-name          = var.lb-nat-rule-name
  lb-probe-name             = var.lb-probe-name
  lb-rule-name              = var.lb-rule-name
  nat-gtw-name              = var.nat-gtw-name
  nat-gtw-pip               = var.nat-gtw-pip
  tags                      = local.common_tags
}
module "vmss" {
  source                  = "../modules/vmss"
  vmss-name               = var.vmss-name
  vmss-nic-name           = var.vmss-nic-name
  environment             = var.environment
  sku_name                = var.sku_name
  rg_name                 = var.rg_name
  location                = var.location
  application_subnet_id   = module.network.application_subnet_id
  backend_address_pool_id = module.lb.backend_address_pool_id
  tags                    = local.common_tags
}
module "autoscale" {
  source          = "../modules/auto_scaling"
  auto-scale-name = var.auto-scale-name
  rg_name         = module.resource_group.rg_name
  location        = module.resource_group.location
  target-vmss-id  = module.vmss.vmss-id
  tags            = local.common_tags
}
module "entraid" {
  source = "../modules/entra_id"
  rg_id  = module.resource_group.rg_id
}