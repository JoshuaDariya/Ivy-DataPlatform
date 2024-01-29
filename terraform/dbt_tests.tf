// ----------- DBT TESTS ITEMS -------------
resource "snowflake_email_notification_integration" "dbt_tests_emailing" { 
  name    = "dbt_test_failures"  
  comment = "A notification integration for dbt tests."
  enabled = true  
  allowed_recipients = ["d5924730.ivyrehab.onmicrosoft.com@amer.teams.ms"]
}

resource "snowflake_task" "prod_dbt_tests_task" {
  comment = "dbt task to email failures"

  database  = var.prod
  schema    = "DBT_TESTS"
  warehouse = "IVY_WH"

  name          = "dbt_tests_data_check_task"
  schedule      = "USING CRON 0 9 * * * America/New_York"
  sql_statement = "CALL check_dbt_tests_data_and_alert()"
  enabled       = true
}

resource "snowflake_task" "qa_dbt_tests_task" {
  comment = "dbt task to email failures"

  database  = var.qa
  schema    = "DBT_TESTS"
  warehouse = "IVY_WH"

  name          = "dbt_tests_data_check_task"
  sql_statement = "CALL check_dbt_tests_data_and_alert()"
  enabled       = false
}

resource "snowflake_task" "dev_dbt_tests_task" {
  comment = "dbt task to email failures"

  database  = var.dev
  schema    = "DBT_TESTS"
  warehouse = "IVY_WH"

  name          = "dbt_tests_data_check_task"
  sql_statement = "CALL check_dbt_tests_data_and_alert()"
  enabled       = false
}