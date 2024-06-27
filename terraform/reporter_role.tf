
// ------------- POWER BI ROLE ACCESS -----------------

resource "snowflake_grant_privileges_to_role" "reporter_access_db_grant_landing" {
  privileges = ["USAGE", "MONITOR"]
  role_name  = var.powerbi_role
  on_account_object {
    object_type = "DATABASE"

    object_name = var.landing
  }
}

resource "snowflake_grant_privileges_to_role" "reporter_access_db_grant_dev" {
  privileges = ["USAGE", "MONITOR"]
  role_name  = var.powerbi_role
  on_account_object {
    object_type = "DATABASE"

    object_name = var.dev
  }
}

resource "snowflake_grant_privileges_to_role" "reporter_access_db_grant_qa" {
  privileges = ["USAGE","MONITOR"]
  role_name  = var.powerbi_role
  on_account_object {
    object_type = "DATABASE"

    object_name = var.qa
  }
}

resource "snowflake_grant_privileges_to_role" "reporter_access_db_grant_prod" {
  privileges = ["USAGE", "MONITOR"]
  role_name  = var.powerbi_role
  on_account_object {
    object_type = "DATABASE"

    object_name = var.prod
  }
}

// ---------------- FUTURE GRANTS --------------------
# resource "snowflake_grant_privileges_to_role" "reporter_future_access_grant_landing" {
#   privileges = ["USAGE","MONITOR"]
#   role_name  = var.powerbi_role
#   for_each = var.landing_schemas_available_to_reporter

#   dynamic "on_schema" {
#     for_each = {
#       schema_name = each.key
#     }

#     content {
#       schema_name = on_schema.value
#     }
#   }
# }
resource "snowflake_grant_privileges_to_role" "reporter_future_access_grant_landing" {
  privileges = ["USAGE","MONITOR"]
  role_name  = var.powerbi_role

  on_schema {

      future_schemas_in_database = var.landing
    }
}

resource "snowflake_grant_privileges_to_role" "reporter_future_access_grant_dev" {
  privileges = ["USAGE","MONITOR"]
  role_name  = var.powerbi_role
  on_schema {

    future_schemas_in_database = var.dev
  }
}

resource "snowflake_grant_privileges_to_role" "reporter_future_access_grant_qa" {
  privileges = ["USAGE","MONITOR"]
  role_name  = var.powerbi_role
  on_schema {

    future_schemas_in_database = var.qa
  }
}

resource "snowflake_grant_privileges_to_role" "reporter_future_access_grant_prod" {
  privileges = ["USAGE","MONITOR"]
  role_name  = var.powerbi_role
  on_schema {

    future_schemas_in_database = var.prod
  }
}


// ---------------- SCHEMA GRANTS --------------------
# resource "snowflake_grant_privileges_to_role" "reporter_access_schema_grant_landing" {
#   privileges = ["USAGE", "MONITOR"]
#   role_name  = var.powerbi_role
#   for_each = var.landing_schemas_available_to_reporter

#   dynamic "on_schema" {
#     for_each = {
#       schema_name = each.key
#     }

#     content {
#       schema_name = on_schema.value
#     }
#   }
# }

resource "snowflake_grant_privileges_to_role" "reporter_access_schema_grant_landing" {
  privileges = ["USAGE", "MONITOR"]
  role_name  = var.powerbi_role
   on_schema {
    all_schemas_in_database = var.landing
  }
}
 
resource "snowflake_grant_privileges_to_role" "reporter_access_schema_grant_dev" {
  privileges = ["USAGE", "MONITOR"]
  role_name  = var.powerbi_role
  on_schema {
    all_schemas_in_database = var.dev
  }
}
resource "snowflake_grant_privileges_to_role" "reporter_access_schema_grant_qa" {
  privileges = ["USAGE", "MONITOR"]
  role_name  = var.powerbi_role
  on_schema {
    all_schemas_in_database = var.qa
  }
}
resource "snowflake_grant_privileges_to_role" "reporter_access_schema_grant_prod" {
  privileges = ["USAGE", "MONITOR"]
  role_name  = var.powerbi_role
  on_schema {
    all_schemas_in_database = var.prod
  }
}

//--------- TESTING ACCESS TO TABLES, VIEWS ------------------

resource "snowflake_grant_privileges_to_role" "reporter_access_all_tables_grant_landing" {
  privileges = ["SELECT"]
  role_name  = var.powerbi_role
  on_schema_object {
    all {
        object_type_plural = "TABLES"

        in_database = var.landing
    }
  }
}

resource "snowflake_grant_privileges_to_role" "reporter_access_all_views_grant_landing" {
  privileges = ["SELECT"]
  role_name  = var.powerbi_role
  on_schema_object {
    all {
        object_type_plural = "VIEWS"

        in_database = var.landing
    }
  }
}

resource "snowflake_grant_privileges_to_role" "reporter_access_all_dts_grant_landing" {
  privileges = ["SELECT"]
  role_name  = var.powerbi_role
  on_schema_object {
    all {
        object_type_plural = "DYNAMIC TABLES"

        in_database = var.landing
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

        in_database = var.dev
    }
  }
}

resource "snowflake_grant_privileges_to_role" "reporter_access_all_views_grant_dev" {
  privileges = ["SELECT"]
  role_name  = var.powerbi_role
  on_schema_object {
    all {
        object_type_plural = "VIEWS"

        in_database = var.dev
    }
  }
}

resource "snowflake_grant_privileges_to_role" "reporter_access_all_dts_grant_dev" {
  privileges = ["SELECT"]
  role_name  = var.powerbi_role
  on_schema_object {
    all {
        object_type_plural = "DYNAMIC TABLES"

        in_database = var.dev
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

        in_database = var.qa
    }
  }
}

resource "snowflake_grant_privileges_to_role" "reporter_access_all_views_grant_qa" {
  privileges = ["SELECT"]
  role_name  = var.powerbi_role
  on_schema_object {
    all {
        object_type_plural = "VIEWS"

        in_database = var.qa
    }
  }
}

resource "snowflake_grant_privileges_to_role" "reporter_access_all_dts_grant_qa" {
  privileges = ["SELECT"]
  role_name  = var.powerbi_role
  on_schema_object {
    all {
        object_type_plural = "DYNAMIC TABLES"

        in_database = var.qa
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

        in_database = var.prod
    }
  }
}

resource "snowflake_grant_privileges_to_role" "reporter_access_all_views_grant_prod" {
  privileges = ["SELECT"]
  role_name  = var.powerbi_role
  on_schema_object {
    all {
        object_type_plural = "VIEWS"

        in_database = var.prod
    }
  }
}

resource "snowflake_grant_privileges_to_role" "reporter_access_all_dts_grant_prod" {
  privileges = ["SELECT"]
  role_name  = var.powerbi_role
  on_schema_object {
    all {
        object_type_plural = "DYNAMIC TABLES"

        in_database = var.prod
    }
  }
}

// -------- FUTURE TABLES ----------

resource "snowflake_grant_privileges_to_role" "reporter_access_future_tables_landing" {
  privileges = ["SELECT"]
  role_name  = var.powerbi_role
  on_schema_object {
    future {
      object_type_plural = "TABLES"
      in_database        = var.landing
    }
  }
}
resource "snowflake_grant_privileges_to_role" "reporter_access_future_tables_dev" {
  privileges = ["SELECT"]
  role_name  = var.powerbi_role
  on_schema_object {
    future {
      object_type_plural = "TABLES"
      in_database        = var.dev
    }
  }
}

resource "snowflake_grant_privileges_to_role" "reporter_access_future_tables_qa" {
  privileges = ["SELECT"]
  role_name  = var.powerbi_role
  on_schema_object {
    future {
      object_type_plural = "TABLES"
      in_database        = var.qa
    }
  }
}

resource "snowflake_grant_privileges_to_role" "reporter_access_future_tables_prod" {
  privileges = ["SELECT"]
  role_name  = var.powerbi_role
  on_schema_object {
    future {
      object_type_plural = "TABLES"
      in_database        = var.prod
    }
  }
}

// -------- FUTURE VIEWS ----------

resource "snowflake_grant_privileges_to_role" "reporter_access_future_views_landing" {
  privileges = ["SELECT"]
  role_name  = var.powerbi_role
  on_schema_object {
    future {
      object_type_plural = "VIEWS"
      in_database        = var.landing
    }
  }
}

resource "snowflake_grant_privileges_to_role" "reporter_access_future_views_dev" {
  privileges = ["SELECT"]
  role_name  = var.powerbi_role
  on_schema_object {
    future {
      object_type_plural = "VIEWS"
      in_database        = var.dev
    }
  }
}

resource "snowflake_grant_privileges_to_role" "reporter_access_future_views_qa" {
  privileges = ["SELECT"]
  role_name  = var.powerbi_role
  on_schema_object {
    future {
      object_type_plural = "VIEWS"
      in_database        = var.qa
    }
  }
}

resource "snowflake_grant_privileges_to_role" "reporter_access_future_views_prod" {
  privileges = ["SELECT"]
  role_name  = var.powerbi_role
  on_schema_object {
    future {
      object_type_plural = "VIEWS"
      in_database        = var.prod
    }
  }
}

// -------- FUTURE DYNAMIC TABLES ----------

resource "snowflake_grant_privileges_to_role" "reporter_access_future_dt_landing" {
  privileges = ["SELECT"]
  role_name  = var.powerbi_role
  on_schema_object {
    future {
      object_type_plural = "DYNAMIC TABLES"
      in_database        = var.landing
    }
  }
}

resource "snowflake_grant_privileges_to_role" "reporter_access_future_dt_dev" {
  privileges = ["SELECT"]
  role_name  = var.powerbi_role
  on_schema_object {
    future {
      object_type_plural = "DYNAMIC TABLES"
      in_database        = var.dev
    }
  }
}

resource "snowflake_grant_privileges_to_role" "reporter_access_future_dt_qa" {
  privileges = ["SELECT"]
  role_name  = var.powerbi_role
  on_schema_object {
    future {
      object_type_plural = "DYNAMIC TABLES"
      in_database        = var.qa
    }
  }
}

resource "snowflake_grant_privileges_to_role" "reporter_access_future_dt_prod" {
  privileges = ["SELECT"]
  role_name  = var.powerbi_role
  on_schema_object {
    future {
      object_type_plural = "DYNAMIC TABLES"
      in_database        = var.prod
    }
  }
}

# Fetch all table names in the schema, excluding the restricted table
data "snowflake_tables" "all_tables" {
  database = "LANDING"
  schema   = "WORKDAY"
}

resource "snowflake_grant_privileges_to_role" "reporter_table_access" {
  for_each = { for table in data.snowflake_tables.all_tables.tables : table.name => table if table.name != "PAYROLL" }

  privileges    = ["SELECT"]
  database_name = "LANDING"
  schema_name   = "WORKDAY"
  role_name  = var.powerbi_role
    dynamic "on_table" {
      for_each = {
        table_name = each.key
      }
    content {
        table_name = on_table.value
    }
  }
}

resource "snowflake_grant_privileges_to_account_role" "reporter_table_access" {
  for_each = { for table in data.snowflake_tables.all_tables.tables : table.name => table if table.name != "PAYROLL" }
  privileges        = ["SELECT"]
  account_role_name = var.powerbi_role
  on_schema_object {
    all {
      object_type_plural = "TABLES"
      in_schema          = "\"${var.landing}\".\"WORKDAY\".\"${each.key}\"" 
    }
  }
}

# resource "snowflake_grant_privileges_to_role" "reporter_future_access_grant_landing" {
#   privileges = ["USAGE","MONITOR"]
#   role_name  = var.powerbi_role
#   for_each = var.landing_schemas_available_to_reporter

#   dynamic "on_schema" {
#     for_each = {
#       schema_name = each.key
#     }

#     content {
#       schema_name = on_schema.value
#     }
#   }
# }