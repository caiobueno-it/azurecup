resource "azurerm_mssql_server" "sqldb_srv" {
  name                         = var.sqldb_srv
  resource_group_name          = var.rg
  location                     = var.location
  version                      = "12.0"
  administrator_login          = "admsql"
  administrator_login_password = "Tftec@2022copa"
  minimum_tls_version          = "1.2"
}

resource "azurerm_mssql_database" "sqldb_prd" {
  name                 = var.sqldb_base
  server_id            = azurerm_mssql_server.sqldb_srv.id
  collation            = "SQL_Latin1_General_CP1_CI_AS"
  license_type         = "LicenseIncluded"
  max_size_gb          = 20
  sku_name             = "S0"
  storage_account_type = "Local"

  depends_on = [
    azurerm_mssql_server.sqldb_srv
  ]

}

resource "azurerm_mssql_database" "sqldb_amb" {
  name                 = "${var.sqldb_base}_${var.sqldb_base_amb[count.index]}"
  server_id            = azurerm_mssql_server.sqldb_srv.id
  collation            = "SQL_Latin1_General_CP1_CI_AS"
  license_type         = "LicenseIncluded"
  max_size_gb          = 20
  sku_name             = "S0"
  storage_account_type = "Local"

  depends_on = [
    azurerm_mssql_server.sqldb_srv
  ]

  count = length(var.sqldb_base_amb)

}
