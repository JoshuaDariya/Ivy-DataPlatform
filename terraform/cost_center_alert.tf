resource "snowflake_email_notification_integration" "cost_center_alert_emailing" { 
  name    = "cost_center_alert"  
  comment = "A notification integration for cost center alert."
  enabled = true  
  allowed_recipients = [var.cost_center_alerts_email]
}

resource "snowflake_task" "create_cost_center_alert" {

  database  = var.prod
  schema    = "WAREHOUSE"
  warehouse="IVY_WH"

  name          = "CREATE_COST_CENTER_ALERT"
  schedule      = "USING CRON 0 12 * * * America/New_York"
  sql_statement = "CALL COST_CENTER_ALERT()"
  user_task_timeout_ms                     = 86400000
}

