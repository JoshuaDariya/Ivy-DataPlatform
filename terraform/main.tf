terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "~> 0.70"
    }
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 1.216.23"  
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

//------------- TERRAFORM ACCOUNT WITH AZURE -----------------
provider "azurerm" {
  skip_provider_registration = true
  features {}
}


# Import the existing resource into Terraform's state
# data "azurerm_resource_group" "imported_rg_dev" {
# name     = "rg-ivydataplatform-dev-eastus"
# }

resource "azurerm_resource_group" "rg_dev" {
    location = "East US"
    name = "rg-ivydataplatform-dev-test"
}

resource "azurerm_data_factory" "adf" {
  name                = "Ivy-dataplatform-test"
  location            = azurerm_resource_group.rg_dev.location
  resource_group_name = azurerm_resource_group.rg_dev.name
}

data "azurerm_client_config" "current" {
}


// ------------- WAREHOUSE -----------------
// resource "snowflake_warehouse" "warehouse" {
//   name           = "IVY_WH_TF" #Change to desired name
//   warehouse_size = "x-small" #Change to desired size
//   auto_suspend   = 60
// }