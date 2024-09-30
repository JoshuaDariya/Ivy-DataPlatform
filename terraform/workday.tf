
resource "snowflake_task" "fivetran_run_workday" {

  database  = var.landing
  schema    = var.workday_workday_schema
  warehouse = "IVY_WH"

  name          = "FIVETRAN_RUN_WORKDAY"
  sql_statement = "select fivetran_python()"

}

resource "snowflake_task" "run_fivetran_workday_transformation_status" {

  comment   = "Task to call CHECK_WORKDAY_TRANSFORMATION_STATUS() procedure to check if workday transformations have finished successfully each day."
  database  = var.landing
  schema    = var.workday_workday_schema
  warehouse = "IVY_WH"
  schedule  = "5 MINUTE"
  name          = "RUN_FIVETRAN_WORKDAY_TRANSFORMATION_STATUS"
  sql_statement = "CALL CHECK_WORKDAY_TRANSFORMATION_STATUS()"
  enabled       = true

}