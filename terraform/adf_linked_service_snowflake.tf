//------------- TERRAFORM ACCOUNT WITH AZURE -----------------
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg_dev" {
    location = "East US"
    name = "rg-ivydataplatform-dev-eastus"
}

data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "key_vault" {
  name                = "snowflakeLoginPassword"
  location            = azurerm_resource_group.rg_dev.location
  resource_group_name = azurerm_resource_group.rg_dev.name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = "standard"
}

resource "azurerm_data_factory" "adf" {
  name                = "Ivy-dataplatform-test"
  location            = azurerm_resource_group.rg_dev.location
  resource_group_name = azurerm_resource_group.rg_dev.name
}

resource "azurerm_data_factory_linked_service_key_vault" "linked_key_vault" {
  name            = "snowflakecredential"
  data_factory_id = azurerm_data_factory.adf.id
  key_vault_id    = azurerm_key_vault.key_vault.id
}

resource "azurerm_data_factory_linked_service_snowflake" "linked_service" {
  name            = "linkedservice_snowflake"
  data_factory_id = azurerm_data_factory.example.id

  connection_string = "jdbc:snowflake://JL89715.east-us-2.azure.snowflakecomputing.com/?user=LingHe &db=LANDING&warehouse=IVY_WH"
  key_vault_password {
    linked_service_name = azurerm_data_factory_linked_service_key_vault.linked_key_vault.name
    secret_name         = "secret"
  }
}