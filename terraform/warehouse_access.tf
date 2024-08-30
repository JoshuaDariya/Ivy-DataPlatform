// ------------- WAREHOUSE GRANTING -----------------
resource "snowflake_warehouse_grant" "developer_grant" {
  warehouse_name = "IVY_WH"
  privilege      = "USAGE"

  roles = [var.developer_role, var.qa_role , var.prod_role]

  with_grant_option = false
}

resource "snowflake_warehouse_grant" "fivetran_grant" {
  warehouse_name = "FIVETRAN_WH"
  privilege      = "USAGE"

  roles = [var.loader_role, var.developer_role, var.qa_role , var.prod_role]

  with_grant_option = false
}

resource "snowflake_warehouse_grant" "power_bi_grant" {
  warehouse_name = "POWER_BI_WH"
  privilege      = "USAGE"

  roles = [var.powerbi_role, var.workday_payroll_role]

  with_grant_option = false
}
