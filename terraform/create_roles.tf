// ------------- ROLES (This should eventually match Azure Provisions) -----------------
resource "snowflake_role" "loader" {
  name = var.loader_role
  comment = "For Fivetran connection"
}

resource "snowflake_role" "transformer_dev" {
  name = var.developer_role
  comment = "For developers and Dev dbt connection"
}

resource "snowflake_role" "transformer_qa" {
  name = var.qa_role
  comment = "For QA dbt connection"
}

resource "snowflake_role" "transformer_prod" {
  name = var.prod_role
  comment = "For Prod dbt job connection"
}

resource "snowflake_role" "reporter" {
  name = var.powerbi_role
  comment = "For BI analysts and PowerBI connection"
}
