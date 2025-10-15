rg_name            = "my-rg-prac-1"
location           = "West Europe"
vnet_name          = "my-vnet-1"
vnet_address_space = ["10.0.0.0/16"]
subnets = {
  "application_subnet" = {
    subnet_name      = "app-subnet"
    address_prefixes = ["10.0.0.0/20"]
  }
  "management_subnet" = {
    subnet_name      = "mgmt-subnet"
    address_prefixes = ["10.0.16.0/20"]
  }
}
nsg_name = "my-app-nsg"
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
lb-name                   = "my-lb-prac-1"
lb-pip-name               = "my-lib-pip"
pip-allocation_method     = "Static"
pip-sku                   = "Standard"
backend-address-pool-name = "my-lb-backend-pool"
lb-nat-rule-name          = "ssh-rule"
lb-probe-name             = "http-probe"
lb-rule-name              = "http-rule"
nat-gtw-name              = "my-nat-gtw"
nat-gtw-pip               = "my-nat-gtw-pip"
vmss-name                 = "my-vmss-1"
vmss-nic-name             = "vmss-nic-1"
environment               = "dev"
auto-scale-name           = "vmss-autoscale"