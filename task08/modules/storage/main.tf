data "archive_file" "app" {
  type        = "tar.gz"
  source_dir  = var.application_path
  output_path = "${path.module}/app.tar.gz"
}

resource "time_static" "start" {}

resource "time_offset" "expiry" {
  base_rfc3339 = time_static.start.rfc3339
  offset_hours = 24
}



resource "azurerm_storage_account" "my_storage" {
  name                     = var.name
  resource_group_name      = var.rg_name
  location                 = var.location
  account_tier             = var.tier
  account_replication_type = var.sa_repl_type

  tags = var.tags
}

resource "azurerm_storage_container" "my_container" {
  name                  = var.sa_cont_name
  storage_account_name  = azurerm_storage_account.my_storage.name
  container_access_type = var.sa_access_type
}

resource "azurerm_storage_blob" "my_archive" {
  name                   = "application.tar.gz"
  storage_account_name   = azurerm_storage_account.my_storage.name
  storage_container_name = azurerm_storage_container.my_container.name

  type   = "Block"
  source = data.archive_file.app.output_path
}


data "azurerm_storage_account_blob_container_sas" "sas" {
  connection_string = azurerm_storage_account.my_storage.primary_connection_string

  container_name = azurerm_storage_container.my_container.name

  https_only = true

  start  = time_static.start.rfc3339
  expiry = time_offset.expiry.rfc3339


  permissions {
    read   = true
    add    = false
    create = false
    write  = false
    delete = false
    list   = true
  }
}



