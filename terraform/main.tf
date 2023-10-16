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

resource "azurerm_resource_group" "rg_dev" {
    location = "East US"
    name = "rg-ivydataplatform-dev-eastus"
}

# Import the existing resource into Terraform's state
data "azurerm_resource_group" "imported_rg_dev" {
name     = "rg-ivydataplatform-dev-eastus"
}

data "azurerm_storage_account" "storage_account" {
  name                     = "ivydwstoragedev"
  resource_group_name = data.azurerm_resource_group.rg_dev.name
}

output "storage_account_tier" {
  value = data.azurerm_storage_account.storage_account.account_tier
}

resource "azurerm_data_factory" "adf" {
  name                = "Ivy-dataplatform-test"
  location            = azurerm_resource_group.rg_dev.location
  resource_group_name = azurerm_resource_group.rg_dev.name

    identity {
    type = "SystemAssigned"
  }
    
}

data "azurerm_key_vault" "key_vault" {
  name                = "ivy-kv-lakehouse-dev"
  resource_group_name = azurerm_resource_group.rg_dev.name
}

data "azurerm_client_config" "current" {
}

resource "azurerm_key_vault_access_policy" "terraform_sp_access" {
  key_vault_id = data.azurerm_key_vault.key_vault.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = azurerm_data_factory.adf.identity[0].principal_id

  key_permissions = [
    "Get", "List",
  ]

  secret_permissions = [
    "Get", "List",
  ]

  certificate_permissions = [
    "Get", "List",
  ]
}


// ------------- WAREHOUSE -----------------
// resource "snowflake_warehouse" "warehouse" {
//   name           = "IVY_WH_TF" #Change to desired name
//   warehouse_size = "x-small" #Change to desired size
//   auto_suspend   = 60
// }