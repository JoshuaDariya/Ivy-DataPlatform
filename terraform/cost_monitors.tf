// ------------- COST ALERTS -----------------

resource "snowflake_resource_monitor" "monitor_1" {
  name         = "FIVETRAN"
  credit_quota = 100

  end_timestamp   = "2024-09-30 17:00"

  warehouses   = ["FIVETRAN_WH"]

}

resource "snowflake_resource_monitor" "monitor_2" {
  name         = "POWER BI"
  credit_quota = 100

  end_timestamp   = "2024-08-31T17:00:00-07:00"

  warehouses   = ["POWER_BI_WH"]

}

resource "snowflake_resource_monitor" "monitor_3" {
  name         = "DEV USERS"
  credit_quota = 100

  end_timestamp   = "2024-08-31T17:00:00-07:00"

  warehouses   = ["IVY_WH"]

}
