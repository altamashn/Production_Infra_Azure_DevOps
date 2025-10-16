resource "azurerm_monitor_autoscale_setting" "auto-scale" {
  name                = var.auto-scale-name
  resource_group_name = var.rg_name
  location            = var.location
  target_resource_id  = var.target-vmss-id
  profile {
    name = "autoscale-rule"
    capacity {
      default = 2
      minimum = 2
      maximum = 5
    }
    rule {
      metric_trigger {
        metric_name        = "Percentage CPU"
        metric_resource_id = var.target-vmss-id
        threshold          = 10
        operator           = "LessThan"
        statistic          = "Average"
        time_aggregation   = "Average"
        time_grain         = "PT1M"
        time_window        = "PT5M"
      }
      scale_action {
        direction = "Decrease"
        value     = 1
        type      = "ChangeCount"
        cooldown  = "PT5M"

      }

    }
    rule {
      metric_trigger {
        metric_name        = "Percentage CPU"
        metric_resource_id = var.target-vmss-id
        threshold          = 80
        operator           = "GreaterThan"
        statistic          = "Average"
        time_aggregation   = "Average"
        time_grain         = "PT1M"
        time_window        = "PT5M"
      }
      scale_action {
        direction = "Increase"
        value     = 1
        type      = "ChangeCount"
        cooldown  = "PT5M"

      }
    }
  }
  notification {
    email {
      custom_emails = [data.azurerm_key_vault_secret.notificationemail.value]
    }
  }
  tags = var.tags
}