 // ------------- DEVELOPER ROLE ACCESS -----------------

resource "snowflake_grant_privileges_to_role" "developer_access_db_grant_landing" {
  privileges = ["USAGE", "MONITOR"]
  role_name  = var.developer_role
  on_account_object {
    object_type = "DATABASE"

    object_name = "LANDING"
  }
}

resource "snowflake_grant_privileges_to_role" "developer_access_db_grant_dev" {
  privileges = ["USAGE", "MODIFY", "MONITOR"]
  role_name  = var.developer_role
  on_account_object {
    object_type = "DATABASE"

    object_name = "DEV"
  }
}


// ---------------- FUTURE GRANTS --------------------

resource "snowflake_grant_privileges_to_role" "developer_future_access_grant_landing" {
  privileges = ["USAGE","MONITOR"]
  role_name  = var.developer_role
  on_schema {

    future_schemas_in_database = "LANDING"
  }
}

resource "snowflake_grant_privileges_to_role" "developer_future_access_grant_dev" {
  privileges = ["MODIFY", "CREATE TABLE", "CREATE VIEW", "CREATE DYNAMIC TABLE", "USAGE","MONITOR"]
  role_name  = var.developer_role
  on_schema {

    future_schemas_in_database = "DEV"
  }
}


// ---------------- CURRENT SCHEMA GRANTS --------------------

resource "snowflake_grant_privileges_to_role" "developer_access_schema_grant_landing" {
  privileges = ["USAGE", "MONITOR"]
  role_name  = var.developer_role
  on_schema {
    all_schemas_in_database = "LANDING"
  }
}
resource "snowflake_grant_privileges_to_role" "developer_access_schema_grant_dev" {
  privileges = ["USAGE","CREATE TABLE", "CREATE VIEW", "CREATE DYNAMIC TABLE","MODIFY", "MONITOR"]
  role_name  = var.developer_role
  on_schema {
    all_schemas_in_database = "DEV"
  }
}


//--------- LANDING ACCESS TO CURRENT TABLES, VIEWS ------------------

resource "snowflake_grant_privileges_to_role" "developer_access_all_tables_grant_landing" {
  privileges = ["SELECT"]
  role_name  = var.developer_role
  on_schema_object {
    all {
        object_type_plural = "TABLES"

        in_database = "LANDING"
    }
  }
}

resource "snowflake_grant_privileges_to_role" "developer_access_all_views_grant_landing" {
  privileges = ["SELECT"]
  role_name  = var.developer_role
  on_schema_object {
    all {
        object_type_plural = "VIEWS"

        in_database = "LANDING"
    }
  }
}


// -------------- DEV ACCESS TO CURRENT TABLES AND VIEWS -------------------
resource "snowflake_grant_privileges_to_role" "developer_access_all_tables_grant_dev" {
  all_privileges = true
  role_name  = var.developer_role
  on_schema_object {
    all {
        object_type_plural = "TABLES"

        in_database = "DEV"
    }
  }
}

resource "snowflake_grant_privileges_to_role" "developer_access_all_views_grant_dev" {
  all_privileges = true
  role_name  = var.developer_role
  on_schema_object {
    all {
        object_type_plural = "VIEWS"

        in_database = "DEV"
    }
  }
}

// -------- FUTURE TABLES ----------

resource "snowflake_grant_privileges_to_role" "developer_access_future_tables_landing" {
  privileges = ["SELECT"]
  role_name  = var.developer_role
  on_schema_object {
    future {
      object_type_plural = "TABLES"
      in_database        = "LANDING"
    }
  }
}
resource "snowflake_grant_privileges_to_role" "developer_access_future_tables_dev" {
  all_privileges = true
  role_name  = var.developer_role
  on_schema_object {
    future {
      object_type_plural = "TABLES"
      in_database        = "DEV"
    }
  }
}

// -------- FUTURE VIEWS ----------

resource "snowflake_grant_privileges_to_role" "developer_access_future_views_landing" {
  privileges = ["SELECT"]
  role_name  = var.developer_role
  on_schema_object {
    future {
      object_type_plural = "VIEWS"
      in_database        = "LANDING"
    }
  }
}

resource "snowflake_grant_privileges_to_role" "developer_access_future_views_dev" {
  all_privileges = true
  role_name  = var.developer_role
  on_schema_object {
    future {
      object_type_plural = "VIEWS"
      in_database        = "DEV"
    }
  }
}
