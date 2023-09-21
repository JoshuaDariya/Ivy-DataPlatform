
// ------------- DEV SCHEMA CREATION -----------------

resource "snowflake_schema" "staging_schema" {
      for_each = var.databases

  database = each.key

  name       = "STAGING" #Name would want to be changed to something better
  is_managed = false
}

resource "snowflake_schema" "warehouse_schema" {
        for_each = var.databases

  database = each.key
  name       = "WAREHOUSE" #Name would want to be changed to something better
  is_managed = false
}

resource "snowflake_schema" "presentation_schema" {
        for_each = var.databases

  database = each.key
  name       = "PRESENTATION" #Name would want to be changed to something better
  is_managed = false
}

# // ------------- STAGE SCHEMA CREATION -----------------

# resource "snowflake_schema" "qa_staging_schema" {
#   database   = var.qa
#   name       = "STAGING" #Name would want to be changed to something better
#   is_managed = false
# }
# resource "snowflake_schema" "qa_warehouse_schema" {
#   database   = var.qa
#   name       = "WAREHOUSE" #Name would want to be changed to something better
#   is_managed = false
# }

# resource "snowflake_schema" "qa_presentation_schema" {
#   database   = var.qa
#   name       = "PRESENTATION" #Name would want to be changed to something better
#   is_managed = false
# }
# // ------------- PROD SCHEMA CREATION -----------------

# resource "snowflake_schema" "prod_staging_schema" {
#   database   = var.prod
#   name       = "STAGING" #Name would want to be changed to something better
#   is_managed = false
# }

# resource "snowflake_schema" "prod_warehouse_schema" {
#   database   = var.prod
#   name       = "WAREHOUSE" #Name would want to be changed to something better
#   is_managed = false
# }

# resource "snowflake_schema" "prod_presentation_schema" {
#   database   = var.prod
#   name       = "PRESENTATION" #Name would want to be changed to something better
#   is_managed = false
# }


