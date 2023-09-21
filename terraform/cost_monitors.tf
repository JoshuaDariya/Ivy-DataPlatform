// ------------- COST ALERTS -----------------

resource "snowflake_resource_monitor" "monitor_1" {
  name         = "FIVETRAN"
  credit_quota = 100

  end_timestamp   = "2024-09-01 00:00"

  warehouses   = ["PC_FIVETRAN_WH"]

}

resource "snowflake_resource_monitor" "monitor_2" {
  name         = "POWER BI"
  credit_quota = 100

  end_timestamp   = "2024-09-01 00:00"

  warehouses   = ["POWER_BI_WH"]

}

resource "snowflake_resource_monitor" "monitor_3" {
  name         = "DEV USERS"
  credit_quota = 100

  end_timestamp   = "2024-09-01 00:00"

  warehouses   = ["IVY_WH"]

}
