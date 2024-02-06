
// ------------- SCHEMA CREATION -----------------

resource "snowflake_schema" "staging_schema" {
      for_each = var.databases_with_schema

  database = each.key

  name       = "STAGING" #Name would want to be changed to something better
  is_managed = false
}

resource "snowflake_schema" "warehouse_schema" {
        for_each = var.databases_with_schema

  database = each.key
  name       = "WAREHOUSE" #Name would want to be changed to something better
  is_managed = false
}

resource "snowflake_schema" "presentation_schema" {
        for_each = var.databases_with_schema

  database = each.key
  name       = "PRESENTATION" #Name would want to be changed to something better
  is_managed = false
}

resource "snowflake_schema" "foto_schema" {
        for_each = var.landing_databases_with_schema

  database = each.key
  name       = "FOTO" 
  is_managed = false
}

