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


// -------------- PROD ACCESS TO CURRENT TABLES AND VIEWS -------------------
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
