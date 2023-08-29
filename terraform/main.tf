terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "~> 0.68"
    }
  }
}

provider "snowflake" {
  role = "SYSADMIN"
  account = "JL89715"
  username = "ivy-tf-snow"
  password = "1Ivyuser"
  region = "eastus2.azure"
}

resource "snowflake_database" "db" {
  name = "LANDING" #Creating Landing Zone db
}

resource "snowflake_warehouse" "warehouse" {
  name           = "ivy_wh_tf" #Change to desired name
  warehouse_size = "small" #Change to desired size
  auto_suspend   = 60
}