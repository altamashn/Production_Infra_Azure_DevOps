variable "rg_name" {
  type = string
}
variable "location" {
  type    = string
  default = "West Europe"
  validation {
    condition     = contains(["West Europe", "East US", "Southeast Asia"], var.location)
    error_message = "The location must be one of: West Europe, East US, Southeast Asia."
  }
}
variable "vnet_name" {
  type = string
}

variable "vnet_address_space" {
  type = list(string)
}

variable "subnets" {
  type = map(object({
    subnet_name      = string
    address_prefixes = list(string)
  }))
}
variable "nsg_name" {
  type = string
}
variable "security_rules" {
  type = list(object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  }))
}
variable "lb-pip-name" {
  type = string
}
variable "pip-allocation_method" {
  type = string
}
variable "pip-sku" {
  type = string
}
variable "lb-name" {
  type = string
}
variable "backend-address-pool-name" {
  type = string
}
variable "lb-rule-name" {
  type = string
}
variable "lb-probe-name" {
  type = string
}
variable "lb-nat-rule-name" {
  type = string
}
variable "nat-gtw-pip" {
  type = string
}
variable "nat-gtw-name" {
  type = string
}
variable "vmss-name" {
  type = string
}
variable "sku_name" {
  type = map(string)
  default = {
    "dev"   = "Standard_B1s"
    "stage" = "Standard_B2s"
    "prod"  = "Standard_B2ms"
  }
}


variable "environment" {
  type = string
}
variable "vmss-nic-name" {
  type = string
}
variable "auto-scale-name" {
  type = string
}