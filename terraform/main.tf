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
resource "snowflake_database_grant" "reporter_grant" {
  database_name = "PROD"

  privilege = "SELECT"
  roles     = ["REPORTER"]

  with_grant_option = false
}


// ------------- WAREHOUSE -----------------
resource "snowflake_warehouse" "warehouse" {
  name           = "IVY_WH_TF" #Change to desired name
  warehouse_size = "x-small" #Change to desired size
  auto_suspend   = 60
}