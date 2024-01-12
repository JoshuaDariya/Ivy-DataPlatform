//Might need Loader Access (DONE)
resource "snowflake_file_format" "adaptive_parquet_file_format" {
  name        = "PARQUET_FORMAT"
  database    = var.landing
  schema      = var.adaptive_schema
  format_type = "PARQUET"
  binary_as_text = true
}

//Might need Loader Access (DONE)
resource "snowflake_storage_integration" "azure_adaptive_integration" {
  name    = var.adaptive_azure_int
  type    = "EXTERNAL_STAGE"

  enabled = true

  storage_allowed_locations = [var.azure_adaptive_url_storage_allowed_locations]

  storage_provider         = "Azure"
  storage_aws_role_arn     = var.storage_aws_role_arn ~
}

//Might need Loader Access (DONE)
resource "snowflake_stage" "raintree_v2_stage" {
  name        = var.adaptive_stage
  url         = var.azure_adaptive_url_storage_allowed_locations
  storage_integration = var.adaptive_azure_int
  database    = var.landing
  schema      = var.adaptive_schema 

}