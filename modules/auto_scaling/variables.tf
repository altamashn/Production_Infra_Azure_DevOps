variable "rg_name" {
  type = string
}
variable "location" {
  type = string
}
variable "auto-scale-name" {
  type = string
}
variable "target-vmss-id" {
  type = string
}
variable "tags" {
  type = map(string)
}