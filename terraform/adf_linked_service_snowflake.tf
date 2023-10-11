data "azurerm_key_vault_secret" "snowflakepassword" {
  name         = "snowflakeLoginPassword"
  key_vault_id = data.azurerm_key_vault.key_vault.id
}

output "snowflake_password" {
  value     = data.azurerm_key_vault_secret.snowflakepassword.value
  sensitive = true
}

resource "azurerm_data_factory_linked_service_key_vault" "snowflakecredential" {
  name            = "snowflakecredential"
  data_factory_id = azurerm_data_factory.adf.id
  key_vault_id    = data.azurerm_key_vault.key_vault.id
}

resource "azurerm_data_factory_linked_service_snowflake" "linkedservice_snowflake" {
  name            = "linkedservice_snowflake"
  data_factory_id = azurerm_data_factory.adf.id

  connection_string = "jdbc:snowflake://JL89715.east-us-2.azure.snowflakecomputing.com/?user=LingHe &db=LANDING&warehouse=IVY_WH"
  key_vault_password {
    linked_service_name = azurerm_data_factory_linked_service_key_vault.snowflakecredential.name
    secret_name         = data.azurerm_key_vault_secret.snowflakepassword.name
  }
}