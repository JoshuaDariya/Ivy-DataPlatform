 // ------------- TRANSFORMER PROD ROLE ACCESS -----------------

resource "snowflake_grant_privileges_to_role" "prod_access_db_grant_landing" {
  privileges = ["USAGE", "MONITOR"]
  role_name  = var.prod_role
  on_account_object {
    object_type = "DATABASE"

    object_name = var.landing
  }
}

resource "snowflake_grant_privileges_to_role" "prod_access_db_grant_prod" {
  privileges = ["USAGE", "MODIFY", "MONITOR","CREATE SCHEMA"]
  role_name  = var.prod_role
  on_account_object {
    object_type = "DATABASE"

    object_name = var.prod
  }
}


// ---------------- FUTURE GRANTS --------------------

resource "snowflake_grant_privileges_to_role" "prod_future_access_grant_landing" {
  privileges = ["USAGE","MONITOR"]
  role_name  = var.prod_role
  on_schema {

    future_schemas_in_database = var.landing
  }
}

resource "snowflake_grant_privileges_to_role" "prod_future_access_grant_prod" {
  privileges = ["MODIFY", "CREATE TABLE", "CREATE VIEW", "CREATE DYNAMIC TABLE", "USAGE","MONITOR"]
  role_name  = var.prod_role
  on_schema {

    future_schemas_in_database = var.prod
  }
}


// ---------------- CURRENT SCHEMA GRANTS --------------------

resource "snowflake_grant_privileges_to_role" "prod_access_schema_grant_landing" {
  privileges = ["USAGE", "MONITOR"]
  role_name  = var.prod_role
  on_schema {
    all_schemas_in_database = var.landing
  }
}
resource "snowflake_grant_privileges_to_role" "prod_access_schema_grant_prod" {
  privileges = ["USAGE","CREATE TABLE", "CREATE VIEW", "CREATE DYNAMIC TABLE","MODIFY", "MONITOR"]
  role_name  = var.prod_role
  on_schema {
    all_schemas_in_database = var.prod
  }
}


//--------- LANDING ACCESS TO CURRENT TABLES, VIEWS ------------------

resource "snowflake_grant_privileges_to_role" "prod_access_all_tables_grant_landing" {
  privileges = ["SELECT"]
  role_name  = var.prod_role
  on_schema_object {
    all {
        object_type_plural = "TABLES"

        in_database = var.landing
    }
  }
}

resource "snowflake_grant_privileges_to_role" "prod_access_all_views_grant_landing" {
  privileges = ["SELECT"]
  role_name  = var.prod_role
  on_schema_object {
    all {
        object_type_plural = "VIEWS"

        in_database = var.landing
    }
  }
}



// -------------- PROD ACCESS TO CURRENT TABLES, VIEWS, PRODCEDURES, INTEGRATION -------------------
resource "snowflake_grant_privileges_to_role" "prod_access_all_tables_grant_prod" {
  all_privileges = true
  role_name  = var.prod_role
  on_schema_object {
    all {
        object_type_plural = "TABLES"

        in_database = var.prod
    }
  }
}

resource "snowflake_grant_privileges_to_role" "prod_access_all_views_grant_prod" {
  all_privileges = true
  role_name  = var.prod_role
  on_schema_object {
    all {
        object_type_plural = "VIEWS"

        in_database = var.prod
    }
  }
}

resource "snowflake_task_grant" "dbt_tests_grant" {
  database_name = var.prod
  schema_name   = "DBT_TESTS"
  task_name     = "dbt_tests_data_check_task"

  privilege = "ALL PRIVILEGES"
  roles     = [var.prod_role]
}

resource "snowflake_procedure_grant" "prod_access_all_procedures" {
  database_name  = var.prod
  schema_name = "DBT_TESTS"
  privilege   = "USAGE"
  roles       = [var.prod_role]
  on_all   = true
}

resource "snowflake_integration_grant" "dbt_tests_alert_grant" {
  integration_name = "DBT_TEST_FAILURES"

  privilege = "ALL PRIVILEGES"
  roles     = [var.prod_role]

}

// -------- FUTURE TABLES ----------

resource "snowflake_grant_privileges_to_role" "prod_access_future_tables_landing" {
  privileges = ["SELECT"]
  role_name  = var.prod_role
  on_schema_object {
    future {
      object_type_plural = "TABLES"
      in_database        = var.landing
    }
  }
}
resource "snowflake_grant_privileges_to_role" "prod_access_future_tables_prod" {
  all_privileges = true
  role_name  = var.prod_role
  on_schema_object {
    future {
      object_type_plural = "TABLES"
      in_database        = var.prod
    }
  }
}

// -------- FUTURE VIEWS ----------

resource "snowflake_grant_privileges_to_role" "prod_access_future_views_landing" {
  privileges = ["SELECT"]
  role_name  = var.prod_role
  on_schema_object {
    future {
      object_type_plural = "VIEWS"
      in_database        = var.landing
    }
  }
}

resource "snowflake_grant_privileges_to_role" "prod_access_future_views_prod" {
  all_privileges = true
  role_name  = var.prod_role
  on_schema_object {
    future {
      object_type_plural = "VIEWS"
      in_database        = var.prod
    }
  }
}

// -------- FUTURE PRODCEDURES ----------
resource "snowflake_procedure_grant" "prod_access_future_procedures" {
  database_name  = var.prod
  schema_name = "DBT_TESTS"
  privilege   = "USAGE"
  roles       = [var.prod_role]
  on_future   = true
}
