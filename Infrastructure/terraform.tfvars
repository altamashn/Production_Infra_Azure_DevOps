rg_name            = "esp-prd-rg"
location           = "West Europe"
vnet_name          = "esp-prd-vnet"
vnet_address_space = ["10.0.0.0/16"]
subnets = {
  "application_subnet" = {
    subnet_name      = "esp-app-subnet"
    address_prefixes = ["10.0.0.0/20"]
  }
  "management_subnet" = {
    subnet_name      = "esp-mgmt-subnet"
    address_prefixes = ["10.0.16.0/20"]
  }
}
nsg_name = "esp-prd-nsg"
security_rules = [{
  name                       = "allow-http"
  priority                   = 100
  direction                  = "Inbound"
  access                     = "Allow"
  protocol                   = "Tcp"
  source_port_range          = "*"
  destination_port_range     = "80"
  source_address_prefix      = "*"
  destination_address_prefix = "*"
  },
  {
    name                       = "allow-https"
    priority                   = 101
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  },
  {
    name                       = "allow-ssh"
    priority                   = 102
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  },
  {
    name                       = "Allow-LB-To-VMSS"
    priority                   = 103
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  },
  {
    name                       = "Deny-All-Inbound"
    priority                   = 104
    direction                  = "Inbound"
    access                     = "Deny"
    protocol                   = "*"
    source_port_range          = "*"
    source_address_prefix      = "*"
    destination_port_range     = "*"
    destination_address_prefix = "*"
}]
lb-name                   = "esp-prd-lb"
lb-pip-name               = "esp-prd-lb-pip"
pip-allocation_method     = "Static"
pip-sku                   = "Standard"
backend-address-pool-name = "esp-prd-lb-bckpl"
lb-nat-rule-name          = "ssh-rule"
lb-probe-name             = "http-probe"
lb-rule-name              = "http-rule"
nat-gtw-name              = "esp-prd-nat-gtw"
nat-gtw-pip               = "esp-prd-nat-gtw-pip"
vmss-name                 = "esp-prd-vmss"
vmss-nic-name             = "esp-prd-vmss-nic"
environment               = "prod"
auto-scale-name           = "esp-prd-vmss-ausc"