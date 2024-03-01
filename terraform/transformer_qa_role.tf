 // ------------- TRANSFORMER QA ROLE ACCESS -----------------

resource "snowflake_grant_privileges_to_role" "qa_access_db_grant_landing" {
  privileges = ["USAGE", "MONITOR"]
  role_name  = var.qa_role
  on_account_object {
    object_type = "DATABASE"

    object_name = var.landing
  }
}

resource "snowflake_grant_privileges_to_role" "qa_access_db_grant_landing_qa" {
  privileges = ["USAGE", "MONITOR"]
  role_name  = var.qa_role
  on_account_object {
    object_type = "DATABASE"

    object_name = var.landing_qa
  }
}

resource "snowflake_grant_privileges_to_role" "qa_access_db_grant_qa" {
  privileges = ["USAGE", "MODIFY", "MONITOR","CREATE SCHEMA"]
  role_name  = var.qa_role
  on_account_object {
    object_type = "DATABASE"

    object_name = var.qa
  }
}


// ---------------- FUTURE GRANTS --------------------

resource "snowflake_grant_privileges_to_role" "qa_future_access_grant_landing" {
  privileges = ["USAGE","MONITOR"]
  role_name  = var.qa_role
  on_schema {

    future_schemas_in_database = var.landing
  }
}

resource "snowflake_grant_privileges_to_role" "qa_future_access_grant_landing_qa" {
  privileges = ["USAGE","MONITOR"]
  role_name  = var.qa_role
  on_schema {

    future_schemas_in_database = var.landing_qa
  }
}

resource "snowflake_grant_privileges_to_role" "qa_future_access_grant_qa" {
  privileges = ["MODIFY", "CREATE TABLE", "CREATE VIEW", "CREATE DYNAMIC TABLE", "USAGE","MONITOR"]
  role_name  = var.qa_role
  on_schema {

    future_schemas_in_database = var.qa
  }
}


// ---------------- CURRENT SCHEMA GRANTS --------------------

resource "snowflake_grant_privileges_to_role" "qa_access_schema_grant_landing" {
  privileges = ["USAGE", "MONITOR"]
  role_name  = var.qa_role
  on_schema {
    all_schemas_in_database = var.landing
  }
}

resource "snowflake_grant_privileges_to_role" "qa_access_schema_grant_landing_qa" {
  privileges = ["USAGE", "MONITOR"]
  role_name  = var.qa_role
  on_schema {
    all_schemas_in_database = var.landing_qa
  }
}

resource "snowflake_grant_privileges_to_role" "qa_access_schema_grant_qa" {
  privileges = ["USAGE","CREATE TABLE", "CREATE VIEW", "CREATE DYNAMIC TABLE","MODIFY", "MONITOR"]
  role_name  = var.qa_role
  on_schema {
    all_schemas_in_database = var.qa
  }
}


//--------- LANDING ACCESS TO CURRENT TABLES, VIEWS ------------------

resource "snowflake_grant_privileges_to_role" "qa_access_all_tables_grant_landing" {
  privileges = ["SELECT"]
  role_name  = var.qa_role
  on_schema_object {
    all {
        object_type_plural = "TABLES"

        in_database = var.landing
    }
  }
}

resource "snowflake_grant_privileges_to_role" "qa_access_all_tables_grant_landing_qa" {
  privileges = ["SELECT"]
  role_name  = var.qa_role
  on_schema_object {
    all {
        object_type_plural = "TABLES"

        in_database = var.landing_qa
    }
  }
}

resource "snowflake_grant_privileges_to_role" "qa_access_all_views_grant_landing" {
  privileges = ["SELECT"]
  role_name  = var.qa_role
  on_schema_object {
    all {
        object_type_plural = "VIEWS"

        in_database = var.landing
    }
  }
}

resource "snowflake_grant_privileges_to_role" "qa_access_all_views_grant_landing_qa" {
  privileges = ["SELECT"]
  role_name  = var.qa_role
  on_schema_object {
    all {
        object_type_plural = "VIEWS"

        in_database = var.landing_qa
    }
  }
}


// -------------- QA ACCESS TO CURRENT TABLES AND VIEWS -------------------
resource "snowflake_grant_privileges_to_role" "qa_access_all_tables_grant_qa" {
  all_privileges = true
  role_name  = var.qa_role
  on_schema_object {
    all {
        object_type_plural = "TABLES"

        in_database = var.qa
    }
  }
}

resource "snowflake_grant_privileges_to_role" "qa_access_all_views_grant_qa" {
  all_privileges = true
  role_name  = var.qa_role
  on_schema_object {
    all {
        object_type_plural = "VIEWS"

        in_database = var.qa
    }
  }
}

// -------- FUTURE TABLES ----------

resource "snowflake_grant_privileges_to_role" "qa_access_future_tables_landing" {
  privileges = ["SELECT"]
  role_name  = var.qa_role
  on_schema_object {
    future {
      object_type_plural = "TABLES"
      in_database        = var.landing
    }
  }
}

resource "snowflake_grant_privileges_to_role" "qa_access_future_tables_landing_qa" {
  privileges = ["SELECT"]
  role_name  = var.qa_role
  on_schema_object {
    future {
      object_type_plural = "TABLES"
      in_database        = var.landing_qa
    }
  }
}

resource "snowflake_grant_privileges_to_role" "qa_access_future_tables_qa" {
  all_privileges = true
  role_name  = var.qa_role
  on_schema_object {
    future {
      object_type_plural = "TABLES"
      in_database        = var.qa
    }
  }
}

// -------- FUTURE VIEWS ----------

resource "snowflake_grant_privileges_to_role" "qa_access_future_views_landing" {
  privileges = ["SELECT"]
  role_name  = var.qa_role
  on_schema_object {
    future {
      object_type_plural = "VIEWS"
      in_database        = var.landing
    }
  }
}

resource "snowflake_grant_privileges_to_role" "qa_access_future_views_landing_qa" {
  privileges = ["SELECT"]
  role_name  = var.qa_role
  on_schema_object {
    future {
      object_type_plural = "VIEWS"
      in_database        = var.landing_qa
    }
  }
}

resource "snowflake_grant_privileges_to_role" "qa_access_future_views_qa" {
  all_privileges = true
  role_name  = var.qa_role
  on_schema_object {
    future {
      object_type_plural = "VIEWS"
      in_database        = var.qa
    }
  }
}


resource "snowflake_procedure_grant" "qa_access_all_procedures" {
  database_name  = var.qa
  schema_name = "DBT_TESTS"
  privilege   = "USAGE"
  roles       = [var.qa_role]
  on_all   = true
}

resource "snowflake_procedure_grant" "qa_access_future_procedures" {
  database_name  = var.qa
  schema_name = "DBT_TESTS"
  privilege   = "USAGE"
  roles       = [var.qa_role]
  on_future   = true
}