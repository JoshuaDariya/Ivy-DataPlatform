// ------------- ROLES (This should eventually match Azure Provisions) -----------------
resource "snowflake_role" "loader" {
  name = var.loader_role
  comment = "For Fivetran connection"
}

resource "snowflake_role" "transformer_dev" {
  name = "TRANSFORMER_DEV"
  comment = "For developers and Dev dbt connection"
}

resource "snowflake_role" "transformer_qa" {
  name = "TRANSFORMER_QA"
  comment = "For QA dbt connection"
}

resource "snowflake_role" "transformer_prod" {
  name = "TRANSFORMER_PROD"
  comment = "For Prod dbt job connection"
}

resource "snowflake_role" "reporter" {
  name = var.powerbi_role
  comment = "For BI analysts and PowerBI connection"
}
