
// ------------- LOADER ROLE ACCESS -----------------
resource "snowflake_grant_privileges_to_role" "fivetran_access_db_grant" {
  privileges = ["USAGE","MODIFY", "MONITOR"]
  role_name  = "LOADER"
  on_account_object {
    object_type = "DATABASE"
    object_name = var.landing
  }
}


resource "snowflake_grant_privileges_to_role" "fivetran_access_schema_grant" {
  privileges = ["USAGE","CREATE TABLE", "CREATE VIEW", "CREATE DYNAMIC TABLE","MODIFY", "MONITOR"]
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

//--------- TESTING --------

resource "snowflake_grant_privileges_to_role" "fivetran_access_all_tables_grant" {
  privileges = ["SELECT", "INSERT"]
  role_name  = "LOADER"
  on_schema_object {
    all {
        object_type_plural = "TABLES"
        in_database = var.landing
    }
  }
}

resource "snowflake_grant_privileges_to_role" "fivetran_access_all_views_grant" {
  privileges = ["SELECT", "INSERT"]
  role_name  = "LOADER"
  on_schema_object {
    all {
        object_type_plural = "VIEWS"
        in_database = var.landing
    }
  }
}

resource "snowflake_grant_privileges_to_role" "fivetran_access_all_materialized_grant" {
  privileges = ["SELECT", "INSERT"]
  role_name  = "LOADER"
  on_schema_object {
    all {
        object_type_plural = "DYNAMIC TABLES"
        in_database = var.landing
    }
  }
}