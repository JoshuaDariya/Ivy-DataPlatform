resource "snowflake_storage_integration" "azure_zingtree_integration" {
  name    = var.zingtree_azure_int
  type    = "EXTERNAL_STAGE"
  enabled = true
  storage_allowed_locations = [var.azure_zingtree_url_storage_allowed_locations]
  storage_provider         = "AZURE"
  azure_tenant_id = var.azure_tenant
}

resource "snowflake_stage" "zingtree_stage" {
  name        = var.zingtree_stage
  url         = var.azure_zingtree_url_storage_allowed_locations
  storage_integration = var.zingtree_azure_int
  database    = var.landing
  schema      = var.zingtree_schema 

}

resource "snowflake_storage_integration" "azure_zingtree_integration_prod" {
  name    = var.zingtree_azure_int_prod
  type    = "EXTERNAL_STAGE"
  enabled = true
  storage_allowed_locations = [var.azure_zingtree_url_storage_allowed_locations_prod]
  storage_provider         = "AZURE"
  azure_tenant_id = var.azure_tenant
}

resource "snowflake_stage" "zingtree_stage_prod" {
  name        = var.zingtree_stage_prod
  url         = var.azure_zingtree_url_storage_allowed_locations_prod
  storage_integration = var.zingtree_azure_int_prod
  database    = var.landing
  schema      = var.zingtree_schema 

}