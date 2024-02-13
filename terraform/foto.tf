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
  storage_allowed_locations = [var.azure_foto_url_storage_allowed_locations]
  storage_provider         = "AZURE"
  azure_tenant_id     = var.azure_tenant
}

resource "snowflake_stage" "snowflake_foto_stage" {
  name        = var.foto_stage
  url         = var.azure_foto_url_storage_allowed_locations
  storage_integration = var.foto_azure_int
  database    = var.landing
  schema      = var.foto_schema 

}

resource "snowflake_task" "foto_data_loading_testing" {

  database  = var.landing
  schema    = var.foto_schema

  name          = "CREATE_LOADING_PROCESS_RESULTS_TABLE"
  schedule      = "USING CRON 0 9 * * * America/New_York"
  sql_statement = "CALL CREATE_LOADING_PROCESS_RESULTS_TABLE()"

  user_task_timeout_ms                     = 86400000
  user_task_managed_initial_warehouse_size = "LARGE"
  enabled = true
}

resource "snowflake_email_notification_integration" "foto_ingestion_failures" { 
  name    = "foto_ingestion_failures"  
  comment = "A notification integration for foto ingestion."
  enabled = true  
  allowed_recipients = [var.alerts_email]
}
