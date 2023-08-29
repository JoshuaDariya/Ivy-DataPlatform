terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "~> 0.70"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg-ivydataplatform-prod-eastus"
    storage_account_name = "stivylakehouseprod"
    container_name       = "ivy-tf-container"
    key                  = "tf/terraform.tfstate"
  }
}

provider "snowflake" {
  role = "SYSADMIN"
  account = var.account
  username = var.username
  password = var.password
  region = var.region
}

resource "snowflake_database" "db" {
  name = "LANDING" #Creating Landing Zone db
}

resource "snowflake_warehouse" "warehouse" {
  name           = "IVY_WH_TF" #Change to desired name
  warehouse_size = "small" #Change to desired size
  auto_suspend   = 60
}