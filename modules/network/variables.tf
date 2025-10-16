variable "vnet_name" {
  type = string
}
variable "rg_name" {
  type = string
}
variable "location" {
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
variable "tags" {
  type = map(string)
}