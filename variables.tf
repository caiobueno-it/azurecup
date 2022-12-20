variable "rg" {}
variable "location" {}
variable "amb" {
  type = list(string)
}

variable "sto" {}
variable "kv" {}

variable "asp" {}
variable "app" {}
variable "app_slot" {
  type = list(string)
}

variable "sqldb_srv" {}
variable "sqldb_base" {}
variable "sqldb_base_amb" {
  type = list(string)
}