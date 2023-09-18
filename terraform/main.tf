terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "~> 0.70"
    }
  }
  // ------- LOCATION OF TERRAFORM STATE FILE -------
  backend "azurerm" {
    resource_group_name  = "rg-ivydataplatform-prod-eastus"
    storage_account_name = "stivylakehouseprod"
    container_name       = "ivy-tf-container"
    key                  = "tf/terraform.tfstate"
  }
}

//------------- TERRAFORM ACCOUNT WITH SNOWFLAKE -----------------
provider "snowflake" {
  role = "ACCOUNTADMIN"
  account = var.account
  username = var.username
  password = var.password
  region = var.region
}

// ------------- DATABASE CREATION -----------------
resource "snowflake_database" "db" {
    for_each = var.databases

  name = each.key
}

// ------------- SCHEMA CREATION -----------------

resource "snowflake_schema" "dev_schema" {
  database   = "DEV"
  name       = "LANDING" #Name would want to be changed to something better
  is_managed = false
}

resource "snowflake_schema" "stage_schema" {
  database   = "STAGE"
  name       = "LANDING" #Name would want to be changed to something better
  is_managed = false
}

resource "snowflake_schema" "prod_schema" {
  database   = "PROD"
  name       = "LANDING" #Name would want to be changed to something better
  is_managed = false
}

// ------------- ROLES -----------------
resource "snowflake_role" "loader" {
  name = "LOADER"
  comment = "For Fivetran connection, dbt job to create zero copy clones"
}

resource "snowflake_role" "transformer_dev" {
  name = "TRANSFORMER_DEV"
  comment = "For developers and Dev dbt connection"
}

resource "snowflake_role" "transformer_stage" {
  name = "TRANSFORMER_STAGE"
  comment = "For Stage dbt connection"
}

resource "snowflake_role" "transformer_prod" {
  name = "TRANSFORMER_PROD"
  comment = "For Prod dbt job connection"
}

resource "snowflake_role" "reporter" {
  name = "REPORTER"
  comment = "For BI analysts and PowerBI connection"
}
// ------------- ROLE ACCESS -----------------


resource "snowflake_database_grant" "dev_access_grant" {
  database_name = "DEV"

  privilege = "USAGE" #Snowflake does not have a clear definition for our case. Investigate further if this is the same as SELECT as this is for Table, External table, View, Stream
  roles     = ["TRANSFORMER_DEV"]

  with_grant_option = false
}

resource "snowflake_database_grant" "stage_access_grant" {
  database_name = "STAGE"

  privilege = "USAGE" #Snowflake does not have a clear definition for our case. Investigate further if this is the same as SELECT as this is for Table, External table, View, Stream
  roles     = ["TRANSFORMER_STAGE"]

  with_grant_option = false
}

resource "snowflake_database_grant" "prod_access_grant" {
  database_name = "PROD"

  privilege = "USAGE" #Snowflake does not have a clear definition for our case. Investigate further if this is the same as SELECT as this is for Table, External table, View, Stream
  roles     = ["REPORTER","TRANSFORMER_PROD"]

  with_grant_option = false
}
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

// ------------- WAREHOUSE -----------------
resource "snowflake_warehouse" "warehouse" {
  name           = "IVY_WH_TF" #Change to desired name
  warehouse_size = "x-small" #Change to desired size
  auto_suspend   = 60
}