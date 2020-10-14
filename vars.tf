  
variable "name" {
  type        = string
}
variable "location" {
  type        = string
}
variable "public_ip_address_allocation" {
  type        = string
}
variable "resource_group_name" {
  type        = string
}
variable "name" {
  type        = string
}
variable "location" {
  type        = string
}
variable "public_ip_address_allocation" {
  type        = string
}
variable "resource_group_name" {
  type        = string
}





resource "azurerm_storage_account" "ADLv2" {
  name                     = var.name_data_lake_v2
  resource_group_name      = data.azurerm_resource_group.RG.name
  location                 = var.location
  account_tier             = var.tier_data_lake
  account_replication_type = var.account_replication_type
  account_kind             = "StorageV2"
  is_hns_enabled           = "true"
}

resource "azurerm_storage_data_lake_gen2_filesystem" "ADLv2_fs" {
  name               = var.name_data_lake_v2_filesystem
  storage_account_id = azurerm_storage_account.ADLv2.id

  properties = {
    hello = "aGVsbG8="
  }
}
