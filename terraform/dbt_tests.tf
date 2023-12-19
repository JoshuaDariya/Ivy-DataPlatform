// ----------- DBT TESTS ITEMS -------------
resource "snowflake_email_notification_integration" "dbt_tests_emailing" { 
  name    = "dbt_test_failures"  
  comment = "A notification integration for dbt tests."
  enabled = true  
  allowed_recipients = ["2e36f225.ivyrehab.onmicrosoft.com@amer.teams.ms"]
}

resource "snowflake_task" "dbt_tests_task" {
  comment = "dbt task to email failures"

  database  = "PROD"
  schema    = "DBT_TESTS"
  warehouse = "IVY_WH"

  name          = "dbt_tests_data_check_task"
  schedule      = "1500 MINUTE"
  sql_statement = "CALL check_dbt_tests_data_and_alert();"
}