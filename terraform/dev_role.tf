// ------------- DEVELOPER ROLE ACCESS -----------------


resource "snowflake_database_grant" "access_grant_landing" {
   database_name = var.landing

   privilege = "USAGE" 
   roles     = ["TRANSFORMER_DEV"]

   with_grant_option = false
}

resource "snowflake_database_grant" "access_grant_qa" {
   database_name = var.qa

   privilege = "USAGE" 
   roles     = ["TRANSFORMER_DEV"]

   with_grant_option = false
}

resource "snowflake_database_grant" "access_grant_prod" {
   database_name = var.prod

   privilege = "USAGE" 
   roles     = ["TRANSFORMER_DEV"]

   with_grant_option = false
}

resource "snowflake_grant_privileges_to_role" "developer_access_grant" {
  privileges = ["USAGE","CREATE SCHEMA", "MODIFY", "MONITOR"]
  role_name  = "TRANSFORMER_DEV"
  on_account_object {
    object_type = "DATABASE"
    object_name = var.dev
  }
}

resource "snowflake_grant_privileges_to_role" "developer_future_access_grant" {
  privileges = ["MODIFY", "CREATE TABLE", "CREATE VIEW", "CREATE DYNAMIC TABLE", "USAGE", "MONITOR"]
  role_name  = "TRANSFORMER_DEV"
  on_schema {
    future_schemas_in_database = var.dev
  }
}