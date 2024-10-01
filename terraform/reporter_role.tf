
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
# Fetch all schema names in the schema, excluding the restricted table
data "snowflake_schemas" "all_schemas_landing" {
  database = var.landing
}


# List of tables to exclude
locals {
  excluded_shcema_workday = [
    "WORKDAY_WORKDAY"
  ]
}

resource "snowflake_grant_privileges_to_role" "reporter_access_schema_grant_landing" {
  for_each = { for schema in data.snowflake_schemas.all_schemas_landing.schemas : schema.name => schema if !contains(local.excluded_shcema_workday, schema.name) }
  
  privileges = ["USAGE", "MONITOR"]
  role_name  = var.powerbi_role

  on_schema {
    schema_name = each.key
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
data "snowflake_tables" "all_tables_workday" {
  database = var.landing
  schema   = "WORKDAY"
}


# List of tables to exclude
locals {
  excluded_tables_workday = [
    "PAYROLL",
    "PAY_ACCUMULATION",
    "PAYROLL_DEDUCTION_INSTANT_MESSENGER",
    "PAYROLL_LINE",
    "PAYROLL_LINE_PAY_COMPONENT",
    "PAYROLL_LINE_RELATED_CALCULATION",
    "PAYROLL_LINE_WITHHOLDING",
    "PAYROLL_NATIONAL_ID"
  ]
}

# Grant access to certain tables
resource "snowflake_table_grant" "table_access_to_workday" {
  for_each = { for table in data.snowflake_tables.all_tables_workday.tables : table.name => table if !contains(local.excluded_tables_workday, table.name) }
  database_name = var.landing
  schema_name   = "WORKDAY"
  table_name    = each.key

  privilege = "SELECT"
  roles     = [var.powerbi_role, var.developer_role, var.prod_role, var.qa_role, var.loader_role, var.workday_payroll_role ]

  with_grant_option = false
}

resource "snowflake_table_grant" "other_roles_table_access_to_workday" {
  for_each = { for table in data.snowflake_tables.all_tables_workday.tables : table.name => table if contains(local.excluded_tables_workday, table.name) }
  database_name = var.landing
  schema_name   = "WORKDAY"
  table_name    = each.key

  privilege = "SELECT"
  roles     = [var.developer_role, var.prod_role, var.qa_role, var.loader_role, var.workday_payroll_role ]

  with_grant_option = false
}

#Grant loader "OWNERSHIP, DELETE, INSERT, TRUNCATE" privilege
resource "snowflake_table_grant" "loader_table_access_to_workday_ownership" {
  for_each = { for table in data.snowflake_tables.all_tables_workday.tables : table.name => table }
  database_name = var.landing
  schema_name   = "WORKDAY"
  table_name    = each.key

  privilege = "OWNERSHIP"
  roles     = [var.loader_role]

  with_grant_option = false
}

resource "snowflake_table_grant" "loader_table_access_to_workday_delete" {
  for_each = { for table in data.snowflake_tables.all_tables_workday.tables : table.name => table }
  database_name = var.landing
  schema_name   = "WORKDAY"
  table_name    = each.key

  privilege = "DELETE"
  roles     = [var.loader_role]

  with_grant_option = false
}

resource "snowflake_table_grant" "loader_table_access_to_workday_insert" {
  for_each = { for table in data.snowflake_tables.all_tables_workday.tables : table.name => table }
  database_name = var.landing
  schema_name   = "WORKDAY"
  table_name    = each.key

  privilege = "INSERT"
  roles     = [var.loader_role]

  with_grant_option = false
}

resource "snowflake_table_grant" "loader_table_access_to_workday_truncate" {
  for_each = { for table in data.snowflake_tables.all_tables_workday.tables : table.name => table }
  database_name = var.landing
  schema_name   = "WORKDAY"
  table_name    = each.key

  privilege = "TRUNCATE"
  roles     = [var.loader_role]

  with_grant_option = false
}