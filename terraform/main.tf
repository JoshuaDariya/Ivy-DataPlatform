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

// ------------- DEV SCHEMA CREATION -----------------

resource "snowflake_schema" "dev_staging_schema" {
  database   = var.dev
  name       = "STAGING" #Name would want to be changed to something better
  is_managed = false
}

resource "snowflake_schema" "dev_warehouse_schema" {
  database   = var.dev
  name       = "WAREHOUSE" #Name would want to be changed to something better
  is_managed = false
}

resource "snowflake_schema" "dev_presentation_schema" {
  database   = var.dev
  name       = "PRESENTATION" #Name would want to be changed to something better
  is_managed = false
}

// ------------- STAGE SCHEMA CREATION -----------------

resource "snowflake_schema" "qa_staging_schema" {
  database   = var.qa
  name       = "STAGING" #Name would want to be changed to something better
  is_managed = false
}
resource "snowflake_schema" "qa_warehouse_schema" {
  database   = var.qa
  name       = "WAREHOUSE" #Name would want to be changed to something better
  is_managed = false
}

resource "snowflake_schema" "qa_presentation_schema" {
  database   = var.qa
  name       = "PRESENTATION" #Name would want to be changed to something better
  is_managed = false
}
// ------------- PROD SCHEMA CREATION -----------------

resource "snowflake_schema" "prod_staging_schema" {
  database   = var.prod
  name       = "STAGING" #Name would want to be changed to something better
  is_managed = false
}

resource "snowflake_schema" "prod_warehouse_schema" {
  database   = var.prod
  name       = "WAREHOUSE" #Name would want to be changed to something better
  is_managed = false
}

resource "snowflake_schema" "prod_presentation_schema" {
  database   = var.prod
  name       = "PRESENTATION" #Name would want to be changed to something better
  is_managed = false
}

// ------------- ROLES (This should eventually match Azure Provisions) -----------------
resource "snowflake_role" "loader" {
  name = "LOADER"
  comment = "For Fivetran connection"
}

resource "snowflake_role" "transformer_dev" {
  name = "TRANSFORMER_DEV"
  comment = "For developers and Dev dbt connection"
}

resource "snowflake_role" "transformer_qa" {
  name = "TRANSFORMER_QA"
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


// ------------- WAREHOUSE GRANTING -----------------
resource "snowflake_warehouse_grant" "developer_grant" {
  warehouse_name = "IVY_WH"
  privilege      = "USAGE"

  roles = ["TRANSFORMER_DEV", "TRANSFORMER_STAGE", "TRANSFORMER_PROD"]

  with_grant_option = false
}

resource "snowflake_warehouse_grant" "fivetran_grant" {
  warehouse_name = "PC_FIVETRAN_WH"
  privilege      = "USAGE"

  roles = ["LOADER"]

  with_grant_option = false
}

resource "snowflake_warehouse_grant" "power_bi_grant" {
  warehouse_name = "POWER_BI_WH"
  privilege      = "USAGE"

  roles = ["REPORTER"]

  with_grant_option = false
}

// ------------- LOADER ROLE ACCESS -----------------
#
// resource "snowflake_database_grant" "fivetran_access_grant_1" {
//   database_name = "LANDING"

//   privilege = "USAGE" 
//   roles     = ["LOADER"]

//   with_grant_option = false
// }

resource "snowflake_grant_privileges_to_role" "fivetran_access_grant_2" {
  privileges = ["USAGE","CREATE", "MONITOR"]
  role_name  = "LOADER"
  on_account_object {
    object_type = "DATABASE"
    object_name = var.landing
  }
}

resource "snowflake_grant_privileges_to_role" "fivetran_future_access_grant" {
  privileges = ["MODIFY", "CREATE TABLE", "CREATE VIEW", "CREATE DYNAMIC TABLE", "USAGE"]
  role_name  = "LOADER"
  on_schema {
    future_schemas_in_database = var.landing
  }
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
// resource "snowflake_warehouse" "warehouse" {
//   name           = "IVY_WH_TF" #Change to desired name
//   warehouse_size = "x-small" #Change to desired size
//   auto_suspend   = 60
// }