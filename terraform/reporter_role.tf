
// ------------- POWER BI ROLE ACCESS -----------------

resource "snowflake_grant_privileges_to_role" "reporter_access_db_grant_landing" {
  privileges = ["USAGE", "MONITOR"]
  role_name  = var.powerbi_role
  on_account_object {
    object_type = "DATABASE"

    object_name = "LANDING"
  }
}

resource "snowflake_grant_privileges_to_role" "reporter_access_db_grant_dev" {
  privileges = ["USAGE", "MONITOR"]
  role_name  = var.powerbi_role
  on_account_object {
    object_type = "DATABASE"

    object_name = "DEV"
  }
}

resource "snowflake_grant_privileges_to_role" "reporter_access_db_grant_qa" {
  privileges = ["USAGE","MONITOR"]
  role_name  = var.powerbi_role
  on_account_object {
    object_type = "DATABASE"

    object_name = "QA"
  }
}

resource "snowflake_grant_privileges_to_role" "reporter_access_db_grant_prod" {
  privileges = ["USAGE", "MONITOR"]
  role_name  = var.powerbi_role
  on_account_object {
    object_type = "DATABASE"

    object_name = "PROD"
  }
}

// ---------------- FUTURE GRANTS --------------------

resource "snowflake_grant_privileges_to_role" "reporter_future_access_grant_landing" {
  privileges = ["USAGE","MONITOR"]
  role_name  = var.powerbi_role
  on_schema {

    future_schemas_in_database = "LANDING"
  }
}

resource "snowflake_grant_privileges_to_role" "reporter_future_access_grant_dev" {
  privileges = ["USAGE","MONITOR"]
  role_name  = var.powerbi_role
  on_schema {

    future_schemas_in_database = "DEV"
  }
}

resource "snowflake_grant_privileges_to_role" "reporter_future_access_grant_qa" {
  privileges = ["USAGE","MONITOR"]
  role_name  = var.powerbi_role
  on_schema {

    future_schemas_in_database = "QA"
  }
}

resource "snowflake_grant_privileges_to_role" "reporter_future_access_grant_prod" {
  privileges = ["USAGE","MONITOR"]
  role_name  = var.powerbi_role
  on_schema {

    future_schemas_in_database = "PROD"
  }
}


// ---------------- SCHEMA GRANTS --------------------

resource "snowflake_grant_privileges_to_role" "reporter_access_schema_grant_landing" {
  privileges = ["USAGE", "MONITOR"]
  role_name  = var.powerbi_role
  on_schema {
    all_schemas_in_database = "LANDING"
  }
}
resource "snowflake_grant_privileges_to_role" "reporter_access_schema_grant_dev" {
  privileges = ["USAGE", "MONITOR"]
  role_name  = var.powerbi_role
  on_schema {
    all_schemas_in_database = "DEV"
  }
}
resource "snowflake_grant_privileges_to_role" "reporter_access_schema_grant_qa" {
  privileges = ["USAGE", "MONITOR"]
  role_name  = var.powerbi_role
  on_schema {
    all_schemas_in_database = "QA"
  }
}
resource "snowflake_grant_privileges_to_role" "reporter_access_schema_grant_prod" {
  privileges = ["USAGE", "MONITOR"]
  role_name  = var.powerbi_role
  on_schema {
    all_schemas_in_database = "PROD"
  }
}

//--------- TESTING ACCESS TO TABLES, VIEWS ------------------

resource "snowflake_grant_privileges_to_role" "reporter_access_all_tables_grant_landing" {
  privileges = ["SELECT"]
  role_name  = var.powerbi_role
  on_schema_object {
    all {
        object_type_plural = "TABLES"

        in_database = "LANDING"
    }
  }
}

resource "snowflake_grant_privileges_to_role" "reporter_access_all_views_grant_landing" {
  privileges = ["SELECT"]
  role_name  = var.powerbi_role
  on_schema_object {
    all {
        object_type_plural = "VIEWS"

        in_database = "LANDING"
    }
  }
}

// -------------- DEV -------------------
resource "snowflake_grant_privileges_to_role" "reporter_access_all_tables_grant_dev" {
  privileges = ["SELECT"]
  role_name  = var.powerbi_role
  on_schema_object {
    all {
        object_type_plural = "TABLES"

        in_database = "DEV"
    }
  }
}

resource "snowflake_grant_privileges_to_role" "reporter_access_all_views_grant_dev" {
  privileges = ["SELECT"]
  role_name  = var.powerbi_role
  on_schema_object {
    all {
        object_type_plural = "VIEWS"

        in_database = "DEV"
    }
  }
}

// ------ QA --------
resource "snowflake_grant_privileges_to_role" "reporter_access_all_tables_grant_qa" {
  privileges = ["SELECT"]
  role_name  = var.powerbi_role
  on_schema_object {
    all {
        object_type_plural = "TABLES"

        in_database = "QA"
    }
  }
}

resource "snowflake_grant_privileges_to_role" "reporter_access_all_views_grant_qa" {
  privileges = ["SELECT"]
  role_name  = var.powerbi_role
  on_schema_object {
    all {
        object_type_plural = "VIEWS"

        in_database = "QA"
    }
  }
}

// --------- PROD -------
resource "snowflake_grant_privileges_to_role" "reporter_access_all_tables_grant_prod" {
  privileges = ["SELECT"]
  role_name  = var.powerbi_role
  on_schema_object {
    all {
        object_type_plural = "TABLES"

        in_database = "PROD"
    }
  }
}

resource "snowflake_grant_privileges_to_role" "reporter_access_all_views_grant_prod" {
  privileges = ["SELECT"]
  role_name  = var.powerbi_role
  on_schema_object {
    all {
        object_type_plural = "VIEWS"

        in_database = "PROD"
    }
  }
}

// -------- FUTURE TABLES AND VIEWS ----------

resource "snowflake_grant_privileges_to_role" "reporter_access_future_tables_landing" {
  privileges = ["SELECT"]
  role_name  = var.powerbi_role
  on_schema_object {
    future {
      object_type_plural = "TABLES,VIEWS"
      in_database        = "LANDING"
    }
  }
}