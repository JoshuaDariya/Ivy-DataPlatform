
// ------------- LOADER ROLE ACCESS -----------------

resource "snowflake_grant_privileges_to_role" "fivetran_access_grant" {
  privileges = ["USAGE","CREATE TABLE","MODIFY", "MONITOR"]
  role_name  = "LOADER"
  on_schema {
    all_schemas_in_database = var.landing
  }
}


resource "snowflake_grant_privileges_to_role" "fivetran_future_access_grant" {
  privileges = ["MODIFY", "CREATE TABLE", "CREATE VIEW", "CREATE DYNAMIC TABLE", "USAGE","MONITOR"]
  role_name  = "LOADER"
  on_schema {
    future_schemas_in_database = var.landing
  }
}
