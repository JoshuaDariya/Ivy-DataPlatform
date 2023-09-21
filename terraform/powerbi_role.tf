
// ------------- POWER BI ROLE ACCESS -----------------
resource "snowflake_database_grant" "reporter_grant" {
        for_each = var.databases

  database_name = each.key
  

  privilege = "USAGE" 
  roles     = ["REPORTER"]

  with_grant_option = false
}

