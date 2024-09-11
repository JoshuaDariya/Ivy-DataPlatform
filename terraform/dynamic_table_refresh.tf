resource "snowflake_task" "dev_dynamic_table_task" {

  database  = var.dev
  schema    = "PRESENTATION"

  name          = "CHECK_DYNAMIC_TABLE_REFRESH_TASK"
  schedule      = "USING CRON 0 12 * * * America/New_York"
  sql_statement = "CALL CHECK_DYNAMIC_TABLE_REFRESH()"

  user_task_timeout_ms                     = 86400000
  user_task_managed_initial_warehouse_size = "SMALL"
  enabled = true
}

resource "snowflake_task" "qa_dynamic_table_task" {

  database  = var.qa
  schema    = "PRESENTATION"

  name          = "CHECK_DYNAMIC_TABLE_REFRESH_TASK"
  schedule      = "USING CRON 0 12 * * * America/New_York"
  sql_statement = "CALL CHECK_DYNAMIC_TABLE_REFRESH()"

  user_task_timeout_ms                     = 86400000
  user_task_managed_initial_warehouse_size = "SMALL"
  enabled = true
}

resource "snowflake_task" "prod_dynamic_table_task" {

  database  = var.prod
  schema    = "PRESENTATION"

  name          = "CHECK_DYNAMIC_TABLE_REFRESH_TASK"
  schedule      = "USING CRON 0 12 * * * America/New_York"
  sql_statement = "CALL CHECK_DYNAMIC_TABLE_REFRESH()"

  user_task_timeout_ms                     = 86400000
  user_task_managed_initial_warehouse_size = "SMALL"
  enabled = true
}

resource "snowflake_email_notification_integration" "dynamic_table_email_integration" { 
  name    = "dynamic_table_refresh_notification_integration"  
  comment = "A notification integration for dynamic table refresh alert."
  enabled = true  
  allowed_recipients = [var.dynamic_table_refresh_email_devqa, var.dynamic_table_refresh_email_prod]
}


