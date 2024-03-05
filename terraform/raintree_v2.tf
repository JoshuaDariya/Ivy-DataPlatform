
//Might need Loader Access (DONE)
resource "snowflake_file_format" "raintree_parquet_file_format" {
  name        = "PARQUET_FORMAT"
  database    = var.landing
  schema      = var.raintree_v2_schema
  format_type = "PARQUET"
  binary_as_text = true
}

//Might need Loader Access (DONE)
resource "snowflake_storage_integration" "s3_raintree_v2" {
  name    = var.raintree_s3_int
  type    = "EXTERNAL_STAGE"

  enabled = true

  storage_allowed_locations = [var.aws_url_storage_allowed_locations]

  storage_provider         = "S3"
  storage_aws_role_arn     = var.storage_aws_role_arn
}

//Might need Loader Access (DONE)
resource "snowflake_stage" "raintree_v2_stage" {
  name        = var.raintree_stage
  url         = var.aws_url_storage_allowed_locations
  storage_integration = var.raintree_s3_int
  database    = var.landing
  schema      = var.raintree_v2_schema 

}

//Might need Loader Access (DONE)
resource "snowflake_task" "ingest_raintree_v2_data_from_s3" {

  database  = var.landing
  schema    = var.raintree_v2_schema

  name          = "SERVERLESS_INGEST_RAINTREEV2"
  schedule      = "USING CRON 30 5 * * * America/New_York"
  sql_statement = "CALL PARENT_INGEST_RAINTREE_V2_DATA(true)"

  user_task_timeout_ms                     = 86400000
  user_task_managed_initial_warehouse_size = "LARGE"
  enabled = true
}

resource "snowflake_task" "batch_testing_stage_to_landing" {

  database  = var.landing
  schema    = var.raintree_v2_schema

  name          = "CREATE_BATCH_PROCESS_RESULTS_TABLE"
  schedule      = "USING CRON 0 9 * * * America/New_York"
  sql_statement = "CALL CREATE_BATCH_PROCESS_RESULTS_TABLE()"

  user_task_timeout_ms                     = 86400000
  user_task_managed_initial_warehouse_size = "LARGE"
  enabled = true
}

resource "snowflake_email_notification_integration" "raintree_ingestion_failures" { 
  name    = "raintree_ingestion_failures"  
  comment = "A notification integration for raintree ingestion."
  enabled = true  
  allowed_recipients = [var.alerts_email]
}