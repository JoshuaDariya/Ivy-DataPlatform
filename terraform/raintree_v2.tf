
//Might need Loader Access (DONE)
resource "snowflake_file_format" "raintree_parquet_file_format" {
  name        = "parquet_format"
  database    = var.landing
  schema      = var.raintree_v2_schema
  format_type = "PARQUET"
}

//Might need Loader Access (DONE)
resource "snowflake_storage_integration" "s3_raintree_v2" {
  name    = var.raintree_s3_int
  comment = "A storage integration for the ingestion of Raintree V2."
  type    = "EXTERNAL_STAGE"

  enabled = true

  storage_allowed_locations = ["<COPY s3 URI from bucket>"]

  storage_provider         = "S3"
  storage_aws_role_arn     = "<INSERT ARN LOCATED IN IAM>Roles>...>"
}

//Might need Loader Access (DONE)
resource "snowflake_stage" "raintree_v2_stage" {
  name        = "raintree_stage"
  url         = "<COPY s3 URI from bucket>"
  storage_integration = "s3_int"
  database    = var.landing
  schema      = var.raintree_v2_schema 

}

//Might need Loader Access (DONE)
resource "snowflake_task" "ingest_raintree_v2_data_from_s3" {
  comment = "Task to execute ingest Raintree V2 on a set schedule through Snowflake"

  database  = var.landing
  schema    = var.raintree_v2_schema
  warehouse = "FIVETRAN_WH" // Might remove for scalable compute when it comes to serverless

  name          = "ingest_raintreev2_data_from_s3"
  schedule      = "0 0 5 * * America/New_York" // Use Cron syntax for 5:00 AM every day in EST or anytime
  sql_statement = "CALL INGEST_RAINTREE_V2_DATA('raintree_v2_stage');" // Potential use: ` if not figure out another way

#   UNCOMMENT THIS IF THE DESIRE IS TO HAVE SERVERLESS TASKS. RESEARCH WHAT AND HOW THIS WORKS 
#   session_parameters = {
#     "foo" : "bar",
#   }

#   user_task_timeout_ms                     = 10000
#   user_task_managed_initial_warehouse_size = "XSMALL"
#   after                                    = [snowflake_task.task.name]
#   when                                     = "foo AND bar"
#   enabled                                  = true
}