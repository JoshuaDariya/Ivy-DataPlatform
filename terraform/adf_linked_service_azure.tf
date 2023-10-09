
resource "azurerm_key_vault" "ivydwstoragedevSASToken" {
  name                = "ivydwstoragedevSASToken"
  location            = azurerm_resource_group.rg_dev.location
  resource_group_name = azurerm_resource_group.rg_dev.name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = "standard"
}

resource "azurerm_data_factory_linked_service_key_vault" "linked_key_vault" {
  name            = "sastoken"
  data_factory_id = azurerm_data_factory.adf.id
  key_vault_id    = azurerm_key_vault.ivydwstoragedevSASToken.id
}


resource "azurerm_data_factory_linked_service_azure_blob_storage" "linked_service" {
  name            = "linkedservice_azureblobstorage"
  data_factory_id = azurerm_data_factory.adf.id

  sas_uri = "https://ivydwstoragedev.blob.core.windows.net/analytics/"
  key_vault_sas_token {
    linked_service_name = azurerm_data_factory_linked_service_key_vault.linked_key_vault.name
    secret_name         = "secret"
  }
}
