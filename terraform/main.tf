terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "0.75"
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
  role = "SYSADMIN"
  account = var.account
  user = var.username
  password = var.password
  region = var.region
}

//------------- TERRAFORM ACCOUNT WITH AZURE -----------------
provider "azurerm" {
  skip_provider_registration = true
  features {}
}

# Import the existing resource into Terraform's state
data "azurerm_resource_group" "imported_rg_dev" {
name     = "rg-ivydataplatform-dev-eastus"
}

