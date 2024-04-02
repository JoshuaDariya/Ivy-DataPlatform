resource "snowflake_storage_integration" "azure_adaptive_integration" {
  name    = var.adaptive_azure_int
  type    = "EXTERNAL_STAGE"
  enabled = true
  storage_allowed_locations = [var.azure_adaptive_url_storage_allowed_locations]
  storage_provider         = "AZURE"
  azure_tenant_id = var.azure_tenant
}

resource "snowflake_stage" "adaptive_stage" {
  name        = var.adaptive_stage
  url         = var.azure_adaptive_url_storage_allowed_locations
  storage_integration = var.adaptive_azure_int
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