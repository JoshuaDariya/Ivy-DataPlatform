
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
  schedule      = "USING CRON 0 9 * * * America/New_York"
  sql_statement = "CALL PARENT_INGEST_RAINTREE_V2_DATA(true)"

  user_task_timeout_ms                     = 86400000
  user_task_managed_initial_warehouse_size = "LARGE"
  enabled = false
}

resource "snowflake_task" "batch_testing_stage_to_landing" {

  database  = var.landing
  schema    = var.raintree_v2_schema

  name          = "CREATE_BATCH_PROCESS_RESULTS_TABLE"
  schedule      = "USING CRON 0 11 * * * America/New_York"
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

resource "snowflake_task" "check_raintre_load_tracking_table" {

  database  = var.landing
  schema    = var.raintree_v2_schema

  name          = "CHECK_RAINTREE_LOAD_MESSAGE_TABLE"
  schedule      = "3 MINUTES"
  sql_statement = "CALL CHECK_RAINTREE_LOAD_MESSAGE()"

  user_task_timeout_ms                     = 86400000
  user_task_managed_initial_warehouse_size = "LARGE"
  enabled = true
}

resource "snowflake_task" "fivetran_run" {

  database  = var.landing
  schema    = var.raintree_v2_schema
  warehouse = "IVY_WH"

  name          = "FIVETRAN_RUN"
  sql_statement = "select fivetran_python()"

}

resource "snowflake_task" "run_fivetran_transformation_status" {

  comment   = "Task to call CHECK_RAINTREE_TRANSFORMATION_STATUS() procedure to check if raintree transformations have finished successfully each day."
  database  = var.landing
  schema    = var.raintree_v2_schema
  warehouse = "IVY_WH"

  name          = "RUN_FIVETRAN_TRANSFORMATION_STATUS"
  sql_statement = "CALL CHECK_RAINTREE_TRANSFORMATION_STATUS()"
  enabled       = true

}

resource "snowflake_email_notification_integration" "raintree_transformation_completion" { 
  name    = "RAINTREE_TRANSFORMATION_COMPLETION"  
  comment = "A notification integration for raintree transformations."
  enabled = true  
  allowed_recipients = [var.transformation_alerts_email]
}

resource "snowflake_alert" "raintree_transformation_success_alert" {
  database  = var.landing
  schema    = var.raintree_v2_schema
  name      = "RAINTREE_TRANSFORMATION_SUCCESS_ALERT"
  warehouse = "IVY_WH"
  alert_schedule {
    interval = 5
  }
  condition = "SELECT * FROM RAINTREE_TRANSFORMATION_STATUS WHERE status_date = CURRENT_DATE() AND status = 'SUCCESS'"
  action    = "CALL SYSTEM$SEND_EMAIL('RAINTREE_TRANSFORMATION_COMPLETION','6f56fb39.ivyrehab.onmicrosoft.com@amer.teams.ms', 'Email Alert: Raintree transformations have successfully finished.','Raintree transformations have successfully finished.')"
  enabled   = true
  comment   = "A daily alert to notify the team of successfully completed raintree transformations."
}

resource "snowflake_alert" "raintree_transformation_failure_alert" {
  database  = var.landing
  schema    = var.raintree_v2_schema
  name      = "RAINTREE_TRANSFORMATION_FAILURE_ALERT"
  warehouse = "IVY_WH"
  alert_schedule {
    interval = 5
  }
  condition = "SELECT * FROM RAINTREE_TRANSFORMATION_STATUS WHERE status_date = CURRENT_DATE() AND status = 'FAILED'"
  action    = "CALL SYSTEM$SEND_EMAIL('RAINTREE_TRANSFORMATION_FAILURE','6f56fb39.ivyrehab.onmicrosoft.com@amer.teams.ms', 'Email Alert: Raintree transformations have failed.','Raintree transformations have failed. View failure details in the Fivetran production environment.')"
  enabled   = true
  comment   = "A daily alert to notify the team of failed raintree transformations."
}