data "azurerm_key_vault_secret" "sastoken" {
  name         = "ivydwstorageSASToken"
  key_vault_id = data.azurerm_key_vault.key_vault.id
}

output "azure_sas_token" {
  value     = data.azurerm_key_vault_secret.sastoken.value
  sensitive = true
}

resource "azurerm_data_factory_linked_service_key_vault" "sastoken" {
  name            = "sastoken"
  data_factory_id = azurerm_data_factory.adf_dev.id
  key_vault_id    = data.azurerm_key_vault.key_vault.id
}

resource "azurerm_data_factory_linked_service_azure_blob_storage" "linkedservice_azureblobstorage" {
  name            = "linkedservice_azureblobstorage"
  data_factory_id = azurerm_data_factory.adf_dev.id

  sas_uri = "https://ivydwstoragedev.blob.core.windows.net/analytics/"
  key_vault_sas_token {
    linked_service_name = azurerm_data_factory_linked_service_key_vault.sastoken.name
    secret_name         = "ivydwstorageSASToken"
  }
}
