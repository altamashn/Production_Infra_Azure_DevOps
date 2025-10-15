variable "rg_name" {
  type = string
}
variable "location" {
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
variable "application_subnet_id" {
  description = "ID of the subnet to attach the VMSS to"
  type        = string
}

variable "backend_address_pool_id" {
  description = "ID of the load balancer backend address pool"
  type        = string
}