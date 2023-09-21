// ------------- WAREHOUSE GRANTING -----------------
resource "snowflake_warehouse_grant" "developer_grant" {
  warehouse_name = "IVY_WH"
  privilege      = "USAGE"

  roles = ["TRANSFORMER_DEV", "TRANSFORMER_QA", "TRANSFORMER_PROD"]

  with_grant_option = false
}

# resource "snowflake_warehouse_grant" "fivetran_grant" {
#   warehouse_name = "PC_FIVETRAN_WH"
#   privilege      = "USAGE"

#   roles = ["LOADER"]

#   with_grant_option = false
# }

resource "snowflake_warehouse_grant" "power_bi_grant" {
  warehouse_name = "POWER_BI_WH"
  privilege      = "USAGE"

  roles = ["REPORTER"]

  with_grant_option = false
}