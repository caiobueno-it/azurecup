variable "rg" {}
variable "location" {}
variable "amb" {
  type = list(string)
}

variable "sqldb_srv" {}
variable "sqldb_base" {}
variable "sqldb_base_amb" {
  type = list(string)
}