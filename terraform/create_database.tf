// ------------- DATABASE CREATION -----------------
resource "snowflake_database" "db" {
    for_each = var.databases

  name = each.key
}