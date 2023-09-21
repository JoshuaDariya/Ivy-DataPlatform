
// ------------- POWER BI ROLE ACCESS -----------------

resource "snowflake_grant_privileges_to_role" "reporter_access_db_grant" {
  privileges = ["USAGE","MODIFY", "MONITOR"]
  role_name  = var.powerbi_role
  on_account_object {
    object_type = "DATABASE"
    for_each = var.databases

    object_name = each.key
  }
}


resource "snowflake_grant_privileges_to_role" "reporter_future_access_grant" {
  privileges = ["USAGE","MONITOR"]
  role_name  = var.powerbi_role
  on_schema {
    for_each = var.databases

    future_schemas_in_database = each.key
  }
}


resource "snowflake_grant_privileges_to_role" "reporter_access_schema_grant" {
  privileges = ["USAGE", "MONITOR"]
  role_name  = var.powerbi_role
  on_schema {
    for_each = var.databases

    all_schemas_in_database = each.key
  }
}

//--------- TESTING ACCESS TO TABLES, VIEWS, DYNAMIC TABLES** --------

resource "snowflake_grant_privileges_to_role" "reporter_access_all_tables_grant" {
  privileges = ["SELECT"]
  role_name  = var.powerbi_role
  on_schema_object {
    all {
        object_type_plural = "TABLES"
        for_each = var.databases

        in_database = each.key
    }
  }
}

resource "snowflake_grant_privileges_to_role" "reporter_access_all_views_grant" {
  privileges = ["SELECT"]
  role_name  = var.powerbi_role
  on_schema_object {
    all {
        object_type_plural = "VIEWS"
        for_each = var.databases

        in_database = each.key
    }
  }
}

resource "snowflake_grant_privileges_to_role" "reporter_access_all_materialized_grant" {
  privileges = ["SELECT"]
  role_name  = var.powerbi_role
  on_schema_object {
    all {
        object_type_plural = "MATERIALIZED VIEWS"
        for_each = var.databases

        in_database = each.key
    }
  }
}