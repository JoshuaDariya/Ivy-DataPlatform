data "azurerm_key_vault_secret" "sastoken" {
  name         = "ivydwstoragedevSASToken"
  key_vault_id = data.azurerm_key_vault.ivydwstoragedevSASToken.id
}

output "azure_sas_token" {
  value     = data.azurerm_key_vault_secret.sastoken.value
  sensitive = true
}

resource "azurerm_data_factory_linked_service_key_vault" "sastoken" {
  name            = "sastoken"
  data_factory_id = azurerm_data_factory.adf.id
  key_vault_id    = data.azurerm_key_vault.ivydwstoragedevSASToken.id
}

resource "azurerm_data_factory_linked_service_azure_blob_storage" "linkedservice_azureblobstorage" {
  name            = "linkedservice_azureblobstorage"
  data_factory_id = azurerm_data_factory.adf.id

  sas_uri = "https://ivydwstoragedev.blob.core.windows.net/analytics/"
  key_vault_sas_token {
    linked_service_name = azurerm_data_factory_linked_service_key_vault.sastoken.name
    secret_name         = data.azurerm_key_vault_secret.sastoken.name
  }
}
