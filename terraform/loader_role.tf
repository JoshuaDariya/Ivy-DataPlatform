
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
  privileges = ["MODIFY", "CREATE TABLE", "CREATE VIEW", "CREATE DYNAMIC TABLE", "USAGE","MONITOR"]
  role_name  = var.loader_role
  on_schema {
    future_schemas_in_database = var.landing
  }
}


resource "snowflake_grant_privileges_to_role" "loader_access_schema_grant" {
  privileges = ["USAGE","CREATE TABLE", "CREATE VIEW", "CREATE DYNAMIC TABLE","MODIFY", "MONITOR"]
  role_name  = var.loader_role
  on_schema {
    all_schemas_in_database = var.landing
  }
}

//--------- LANDING ACCESS TO CURRENT TABLES, VIEWS --------

resource "snowflake_grant_privileges_to_role" "loader_access_all_tables_grant" {
  privileges = ["SELECT", "INSERT"]
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


// ------------ FUTURE TABLES AND VIEWS -----------------
resource "snowflake_grant_privileges_to_role" "loader_access_future_tables_landing" {
  privileges = ["SELECT","INSERT"]
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

//--------- LANDING ACCESS TO PROCEDURES --------
resource "snowflake_procedure_grant" "loader_grant_load_data" {
  database_name  = var.landing
  schema_name = "RAINTREE"
  procedure_name = snowflake_procedure.load_data.name
  arguments {
    name = "Source_Table"
    type = "varchar"
  }
  arguments {
    name = "Destination_Table"
    type = "varchar"
  }
  return_type = "number"
  privilege   = "OWNERSHIP"
  roles       = [var.loader_role]

  lifecycle {
    replace_triggered_by = [snowflake_procedure.load_data]
  }
}

resource "snowflake_procedure_grant" "loader_grant_delete_row" {
  database_name  = var.landing
  schema_name = "RAINTREE"
  procedure_name = snowflake_procedure.delete_row.name
  arguments {
    name = "TABLE_NAME"
    type = "varchar"
  }
  arguments {
    name = "COLUMN1_NAME"
    type = "varchar"
  }
  arguments {
    name = "VALUE1_TO_MATCH"
    type = "varchar"
  }
  arguments {
    name = "COLUMN2_NAME"
    type = "varchar"
  }
  arguments {
    name = "VALUE2_TO_MATCH"
    type = "varchar"
  }
  return_type = "varchar"
  privilege   = "OWNERSHIP"
  roles       = [var.loader_role]

  lifecycle {
    replace_triggered_by = [snowflake_procedure.delete_row]
  }
}