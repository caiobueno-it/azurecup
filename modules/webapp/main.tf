resource "azurerm_service_plan" "asp" {
  name                = var.asp
  resource_group_name = var.rg
  location            = var.location
  sku_name            = "S1"
  os_type             = "Windows"
}

resource "azurerm_windows_web_app" "app" {
  name                = var.app
  resource_group_name = var.rg
  location            = var.location
  service_plan_id     = azurerm_service_plan.asp.id

  site_config {}

  depends_on = [
    azurerm_service_plan.asp
  ]
}

resource "azurerm_windows_web_app_slot" "app_slot" {
  name           = "${var.app}-${var.app_slot[count.index]}"
  app_service_id = azurerm_windows_web_app.app.id

  site_config {}

  depends_on = [
    azurerm_windows_web_app.app
  ]

  count = length(var.app_slot)

}


