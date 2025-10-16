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
variable "tags" {
  type = map(string)
}