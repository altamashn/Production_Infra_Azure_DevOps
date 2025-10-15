resource "azurerm_public_ip" "lb-pip" {
  name                = var.lb-pip-name
  resource_group_name = var.rg_name
  location            = var.location
  allocation_method   = var.pip-allocation_method
  sku                 = var.pip-sku
  zones               = ["1", "2", "3"]
}
resource "azurerm_lb" "lb" {
  name                = var.lb-name
  location            = azurerm_public_ip.lb-pip.location
  resource_group_name = azurerm_public_ip.lb-pip.resource_group_name
  sku                 = "Standard"
  frontend_ip_configuration {
    name                 = "my-lb-frontend-ip"
    public_ip_address_id = azurerm_public_ip.lb-pip.id
  }
}
resource "azurerm_lb_backend_address_pool" "bepool" {
  name            = var.backend-address-pool-name
  loadbalancer_id = azurerm_lb.lb.id
}
resource "azurerm_lb_rule" "lb-rule" {
  name                           = var.lb-rule-name
  protocol                       = "Tcp"
  frontend_ip_configuration_name = "my-lb-frontend-ip"
  frontend_port                  = 80
  backend_port                   = 80
  loadbalancer_id                = azurerm_lb.lb.id
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.bepool.id]
  probe_id                       = azurerm_lb_probe.lb-probe.id
}
resource "azurerm_lb_probe" "lb-probe" {
  name            = var.lb-probe-name
  loadbalancer_id = azurerm_lb.lb.id
  port            = 80
  protocol        = "Http"
  request_path    = "/"
}

resource "azurerm_lb_nat_rule" "lb-nat-rule" {
  name                           = var.lb-nat-rule-name
  protocol                       = "Tcp"
  loadbalancer_id                = azurerm_lb.lb.id
  backend_address_pool_id        = azurerm_lb_backend_address_pool.bepool.id
  frontend_port_start            = 50000
  frontend_port_end              = 50119
  resource_group_name            = azurerm_lb.lb.resource_group_name
  frontend_ip_configuration_name = "my-lb-frontend-ip"
  backend_port                   = 22
}
resource "azurerm_public_ip" "nat-gtw-pip" {
  name                = var.nat-gtw-pip
  resource_group_name = var.rg_name
  location            = var.location
  allocation_method   = var.pip-allocation_method
  sku                 = var.pip-sku
  zones               = ["1"]
}
resource "azurerm_nat_gateway" "nat-gateway" {
  name                    = var.nat-gtw-name
  resource_group_name     = azurerm_lb.lb.resource_group_name
  location                = azurerm_lb.lb.location
  sku_name                = "Standard"
  idle_timeout_in_minutes = 10
  zones                   = ["1"]
}
resource "azurerm_nat_gateway_public_ip_association" "nat-gtw-association" {
  nat_gateway_id       = azurerm_nat_gateway.nat-gateway.id
  public_ip_address_id = azurerm_public_ip.nat-gtw-pip.id
}
resource "azurerm_subnet_nat_gateway_association" "sub-nat-gtw-ass" {
  nat_gateway_id = azurerm_nat_gateway.nat-gateway.id
  subnet_id      = var.subnet_id
}