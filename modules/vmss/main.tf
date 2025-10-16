resource "azurerm_orchestrated_virtual_machine_scale_set" "vmss" {
  name                        = var.vmss-name
  location                    = var.location
  resource_group_name         = var.rg_name
  sku_name                    = lookup(var.sku_name, var.environment, "Standard_B1s")
  platform_fault_domain_count = 1
  instances                   = 3
  zones                       = ["1"]
  user_data_base64            = base64encode(file("${path.module}/userdata.sh"))
  os_profile {
    linux_configuration {
      disable_password_authentication = false
      admin_username                  = data.azurerm_key_vault_secret.akvs.value
      admin_password                  = data.azurerm_key_vault_secret.vmss-password.value
    }
  }
  source_image_reference {
    publisher = "Canonical"
    sku       = "22_04-LTS-gen2"
    version   = "latest"
    offer     = "0001-com-ubuntu-server-jammy"
  }
  os_disk {
    storage_account_type = "Premium_LRS"
    caching              = "ReadWrite"
  }
  network_interface {
    name                          = var.vmss-nic-name
    primary                       = true
    enable_accelerated_networking = false
    ip_configuration {
      name                                   = "ipconfig"
      primary                                = true
      subnet_id                              = var.application_subnet_id
      load_balancer_backend_address_pool_ids = [var.backend_address_pool_id]
    }
  }
  lifecycle {
    ignore_changes = [instances]
  }
  tags = var.tags
}
