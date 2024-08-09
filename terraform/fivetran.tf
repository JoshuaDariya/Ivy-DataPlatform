resource "snowflake_network_rule" "fivetran_api_network_rule" {
  name       = "fivetran_api_network_rule"
  database   = var.landing
  schema     = var.raintree_v2_schema
  comment    = "A network rule for Fivetran's API."
  type       = "HOST_PORT"
  mode       = "EGRESS"
  value_list = ["api.fivetran.com"]
}