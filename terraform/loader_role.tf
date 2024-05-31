
// ------------- LOADER ROLE ACCESS -----------------
resource "snowflake_grant_privileges_to_role" "loader_access_db_grant" {
  privileges = ["USAGE","MODIFY", "MONITOR","CREATE SCHEMA"]
  role_name  = var.loader_role
  on_account_object {
    object_type = "DATABASE"
    object_name = var.landing
  }
}


resource "snowflake_grant_privileges_to_role" "loader_future_access_grant" {
  privileges = ["MODIFY", "CREATE TABLE", "CREATE VIEW", "CREATE DYNAMIC TABLE", "USAGE","MONITOR", "CREATE STAGE"]
  role_name  = var.loader_role
  on_schema {
    future_schemas_in_database = var.landing
  }
}


resource "snowflake_grant_privileges_to_role" "loader_access_schema_grant" {
  privileges = ["USAGE","CREATE TABLE", "CREATE VIEW", "CREATE DYNAMIC TABLE","MODIFY", "MONITOR", "CREATE STAGE"]
  role_name  = var.loader_role
  on_schema {
    all_schemas_in_database = var.landing
  }
}

//--------- LANDING ACCESS TO CURRENT TABLES, VIEWS, FILE FORMAT, AND PROCEDURES --------

resource "snowflake_grant_privileges_to_role" "loader_access_all_tables_grant" {
  privileges = ["SELECT", "INSERT", "TRUNCATE", "DELETE"]
  role_name  = var.loader_role
  on_schema_object {
    all {
        object_type_plural = "TABLES"
        in_database = var.landing
    }
  }
}

resource "snowflake_grant_privileges_to_role" "loader_access_all_views_grant" {
  privileges = ["SELECT", "INSERT"]
  role_name  = var.loader_role
  on_schema_object {
    all {
        object_type_plural = "VIEWS"
        in_database = var.landing
    }
  }
}

resource "snowflake_procedure_grant" "loader_access_all_procedures" {
  database_name  = var.landing
  schema_name = "RAINTREE"
  privilege   = "USAGE"
  roles       = [var.loader_role]
  on_all   = true
}

resource "snowflake_procedure_grant" "loader_access_foto_procedures" {
  database_name  = var.landing
  schema_name = "FOTO"
  privilege   = "USAGE"
  roles       = [var.loader_role]
  on_all   = true
}

resource "snowflake_stage_grant" "loader_current_access_stage_grant" {
  database_name = var.landing
  privilege = "ALL PRIVILEGES"

  roles = [var.loader_role]

  on_all         = true
}

resource "snowflake_file_format_grant" "loader_current_file_format_grant" {
  database_name    = var.landing

  privilege = "ALL PRIVILEGES"
  roles     = [var.loader_role]

  on_all         = true
}

resource "snowflake_task_grant" "loader_access_all_tasks_grant_landing" {
  database_name = var.landing
  privilege = "ALL PRIVILEGES"
  roles     = [var.loader_role]

  on_all    = true
}


// ------------ FUTURE TABLES, VIEWS, FILE FORMAT, TASKS AND PROCEDURES -----------------
resource "snowflake_grant_privileges_to_role" "loader_access_future_tables_landing" {
  privileges = ["SELECT","INSERT", "TRUNCATE", "DELETE"]
  role_name  = var.loader_role
  on_schema_object {
    future {
      object_type_plural = "TABLES"
      in_database        = var.landing
    }
  }
}
resource "snowflake_grant_privileges_to_role" "loader_access_future_views_landing" {
  privileges = ["SELECT","INSERT"]
  role_name  = var.loader_role
  on_schema_object {
    future {
      object_type_plural = "VIEWS"
      in_database        = var.landing
    }
  }
}

resource "snowflake_procedure_grant" "loader_access_future_procedures" {
  database_name  = var.landing
  schema_name = "RAINTREE"
  privilege   = "USAGE"
  roles       = [var.loader_role]
  on_future   = true
}

resource "snowflake_procedure_grant" "loader_access_future_procedures" {
  database_name  = var.landing
  schema_name = "FOTO"
  privilege   = "USAGE"
  roles       = [var.loader_role]
  on_future   = true
}

resource "snowflake_stage_grant" "loader_future_access_stage_grant" {
  database_name = var.landing
  privilege = "ALL PRIVILEGES"

  roles = [var.loader_role]

  on_future         = true
}

resource "snowflake_file_format_grant" "loader_future_file_format_grant" {
  database_name    = var.landing

  privilege = "ALL PRIVILEGES"
  roles     = [var.loader_role]

  on_future        = true
}

resource "snowflake_task_grant" "loader_access_future_tasks_grant_landing" {
  database_name = var.landing
  privilege = "ALL PRIVILEGES"
  roles     = [var.loader_role]

  on_future         = true
}

resource "snowflake_integration_grant" "foto_azure_grant" {
  integration_name = var.foto_azure_int

  privilege = "ALL PRIVILEGES"
  roles     = [var.loader_role]

}

// ------------ RAINTREE V2 SPECIFC ACCESS -----------------
resource "snowflake_integration_grant" "raintree_v2_s3_grant" {
  integration_name = var.raintree_s3_int

  privilege = "ALL PRIVILEGES"
  roles     = [var.loader_role]

}



