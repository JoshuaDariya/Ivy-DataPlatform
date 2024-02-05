resource "snowflake_file_format" "foto_parquet_file_format" {
  name        = "FILEFORMAT_PARQUET"
  database    = var.landing
  schema      = var.foto_schema
  format_type = "PARQUET"
  binary_as_text = true
}

resource "snowflake_storage_integration" "azure_foto_integration" {
  name    = var.foto_azure_int
  type    = "EXTERNAL_STAGE"

  enabled = true

  storage_allowed_locations = [var.azure_url_storage_allowed_locations]

  storage_provider         = "AZURE"
  azure_tenant_id     = var.azure_tenant
}


resource "snowflake_stage" "snowflake_foto_stage" {
  name        = var.foto_stage
  url         = var.azure_url_storage_allowed_locations
  storage_integration = var.foto_azure_int
  database    = var.landing
  schema      = var.foto_schema 

}