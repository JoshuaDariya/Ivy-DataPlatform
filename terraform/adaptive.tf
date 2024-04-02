resource "snowflake_storage_integration" "azure_adaptive_integration_dev" {
  name    = var.adaptive_azure_int_dev
  type    = "EXTERNAL_STAGE"
  enabled = true
  storage_allowed_locations = [var.azure_adaptive_url_storage_allowed_locations]
  storage_provider         = "AZURE"
  azure_tenant_id = var.azure_tenant
}

resource "snowflake_stage" "adaptive_stage_dev" {
  name        = var.adaptive_stage_dev
  url         = var.azure_adaptive_url_storage_allowed_locations
  storage_integration = var.adaptive_azure_int_dev
  database    = var.landing
  schema      = var.adaptive_schema 

}

resource "snowflake_storage_integration" "azure_adaptive_integration_prod" {
  name    = var.adaptive_azure_int_prod
  type    = "EXTERNAL_STAGE"
  enabled = true
  storage_allowed_locations = [var.azure_adaptive_url_storage_allowed_locations_prod]
  storage_provider         = "AZURE"
  azure_tenant_id = var.azure_tenant
}

resource "snowflake_stage" "adaptive_stage_prod" {
  name        = var.adaptive_stage_prod
  url         = var.azure_adaptive_url_storage_allowed_locations_prod
  storage_integration = var.adaptive_azure_int_prod
  database    = var.landing
  schema      = var.adaptive_schema 

}