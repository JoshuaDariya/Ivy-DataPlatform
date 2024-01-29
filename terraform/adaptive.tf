resource "snowflake_file_format" "adaptive_csv_file_format" {
  name        = "ADAPTIVE_CSV_FORMAT"
  database    = var.landing
  schema      = var.adaptive_schema
  format_type = "CSV"
  binary_as_text = true
}

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