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




// ------------- POWER BI ROLE ACCESS -----------------
resource "snowflake_database_grant" "dev_reporter_grant" {
  database_name = var.dev

  privilege = "USAGE" 
  roles     = ["REPORTER"]

  with_grant_option = false
}
resource "snowflake_database_grant" "qa_reporter_grant" {
  database_name = var.qa

  privilege = "USAGE" 
  roles     = ["REPORTER"]

  with_grant_option = false
}
resource "snowflake_database_grant" "prod_reporter_grant" {
  database_name = var.prod

  privilege = "USAGE" 
  roles     = ["REPORTER"]

  with_grant_option = false
}


// ------------- DEVELOPER ROLE ACCESS -----------------  WE NEED TRANSFORMER_DEV, ..._QA, ..._PROD

// resource "snowflake_database_grant" "dev_access_grant" {
//   database_name = "DEV"

//   privilege = "USAGE" 
//   roles     = ["TRANSFORMER_DEV"]

//   with_grant_option = false
// }
// resource "snowflake_grant_privileges_to_role" "dev_future_access_grant" {
//   privileges = ["MODIFY", "CREATE TABLE", "CREATE VIEW", "CREATE DYNAMIC TABLE", "USAGE"]
//   role_name  = "TRANSFORMER_DEV"
//   on_schema {
//     future_schemas_in_database = "DEV"
//   }
// }

// ------------- STAGE ROLE ACCESS -----------------

// resource "snowflake_database_grant" "stage_access_grant" {
//   database_name = "STAGE"

//   privilege = "USAGE" #Snowflake does not have a clear definition for our case. Investigate further if this is the same as SELECT as this is for Table, External table, View, Stream
//   roles     = ["TRANSFORMER_STAGE"]

//   with_grant_option = false
// }
// resource "snowflake_grant_privileges_to_role" "stage_future_access_grant" {
//   privileges = ["MODIFY", "CREATE TABLE", "CREATE VIEW", "CREATE DYNAMIC TABLE", "USAGE"]
//   role_name  = "TRANSFORMER_STAGE"
//   on_schema {
//     future_schemas_in_database = "STAGE"
//   }
// }

// // ------------- PROD ROLE ACCESS -----------------

// resource "snowflake_database_grant" "prod_access_grant" {
//   database_name = "PROD"

//   privilege = "USAGE" #Snowflake does not have a clear definition for our case. Investigate further if this is the same as SELECT as this is for Table, External table, View, Stream
//   roles     = ["REPORTER","TRANSFORMER_PROD"]

//   with_grant_option = false
// }

// resource "snowflake_grant_privileges_to_role" "prod_future_access_grant" {
//   privileges = ["MODIFY", "CREATE TABLE", "CREATE VIEW", "CREATE DYNAMIC TABLE", "USAGE"]
//   role_name  = "TRANSFORMER_PROD"
//   on_schema {
//     future_schemas_in_database = "PROD"
//   }
// }



// ------------- WAREHOUSE -----------------
// resource "snowflake_warehouse" "warehouse" {
//   name           = "IVY_WH_TF" #Change to desired name
//   warehouse_size = "x-small" #Change to desired size
//   auto_suspend   = 60
// }