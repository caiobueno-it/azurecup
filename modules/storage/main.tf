resource "azurerm_storage_account" "sto" {
  name                     = "${var.sto}${var.amb[count.index]}"
  resource_group_name      = var.rg
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  count = length(var.amb)
  
}
