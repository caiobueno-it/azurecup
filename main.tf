module "rg" {
  source   = "./modules/rg"
  rg       = var.rg
  location = var.location
}

module "storage" {
  source   = "./modules/storage"
  rg       = module.rg.name
  location = module.rg.location
  amb      = var.amb
  sto      = var.sto

  depends_on = [
    module.rg
  ]
}

module "vault" {
  source   = "./modules/vault"
  rg       = module.rg.name
  location = module.rg.location
  amb      = var.amb
  kv       = var.kv

  depends_on = [
    module.rg
  ]
}

module "webapp" {
  source   = "./modules/webapp"
  rg       = module.rg.name
  location = module.rg.location
  asp      = var.asp
  app      = var.app
  app_slot = var.app_slot

  depends_on = [
    module.rg
  ]
}

module "database" {
  source         = "./modules/database"
  rg             = module.rg.name
  location       = module.rg.location
  amb            = var.amb
  sqldb_srv      = var.sqldb_srv
  sqldb_base     = var.sqldb_base
  sqldb_base_amb = var.sqldb_base_amb

  depends_on = [
    module.rg
  ]
}