resource "snowflake_storage_integration" "azure_calltracking_integration" {
  name    = var.calltracking_azure_int
  type    = "EXTERNAL_STAGE"
  enabled = true
  storage_allowed_locations = [var.azure_calltracking_url_storage_allowed_locations]
  storage_provider         = "AZURE"
  azure_tenant_id = var.azure_tenant
}

resource "snowflake_stage" "calltracking_stage" {
  name        = var.calltracking_stage
  url         = var.azure_calltracking_url_storage_allowed_locations
  storage_integration = var.calltracking_azure_int
  database    = var.landing
  schema      = var.calltracking_schema 

}

resource "snowflake_storage_integration" "azure_calltracking_integration_prod" {
  name    = var.calltracking_azure_int_prod
  type    = "EXTERNAL_STAGE"
  enabled = true
  storage_allowed_locations = [var.azure_calltracking_url_storage_allowed_locations_prod]
  storage_provider         = "AZURE"
  azure_tenant_id = var.azure_tenant
}

resource "snowflake_stage" "calltracking_stage_prod" {
  name        = var.calltracking_stage_prod
  url         = var.azure_calltracking_url_storage_allowed_locations_prod
  storage_integration = var.calltracking_azure_int_prod
  database    = var.landing
  schema      = var.calltracking_schema 

}