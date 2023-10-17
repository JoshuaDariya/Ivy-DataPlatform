resource "azurerm_template_deployment" "armDeployment" {
  name                = "adf_arm_deploy"
  resource_group_name = data.azurerm_resource_group.imported_rg_dev.name
  deployment_mode     = "Incremental"
    
  template_body =  <<DEPLOY
{ 

    "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#",
    "contentVersion": "1.0.0.0",
    "parameters": {
        "dataFactoryName": {
            "type": "String",
              "defaultValue": "Ivy-dataplatform-snowflake",
            "metadata": {
                "description": "Name of the data factory. Must be globally unique."
            }
        },
        "dataFactoryLocation": {
            "defaultValue": "East US",
            "allowedValues": [
                "East US 2"
            ],
            "type": "String",
            "metadata": {
                "description": "Location of the data factory."
            }
        },
        "azureStorage_connectionString": {
            "type": "SecureString",
            "defaultValue": "https://ivydwstoragedev.blob.core.windows.net/analytics/",
            "metadata": {
                "description": "Connection string for the Azure Storage account."
            }
        },
        "snowflake_connectionString": {
            "type": "string",
            "defaultValue": "jdbc:snowflake://JL89715.east-us-2.azure.snowflakecomputing.com/?user=LingHe &db=LANDING&warehouse=IVY_WH",
            "metadata": {
                "description": "Connection string for the Snowflake account."
            }
        },        
        "blobContainer": {
            "type": "String",
              "defaultValue": "analytics",
            "metadata": {
                "description": "Name of the blob container in the Azure Storage account."
            }
        },
        "inputBlobFolder": {
            "type": "String",
              "defaultValue": "raw/raintree",
            "metadata": {
                "description": "The folder in the blob container that has the input file."
            }
        },
        "inputBlobName": {
            "type": "String",
              "defaultValue": "rbi_referral.csv",
              
            "metadata": {
                "description": "Name of the input file/blob."
            }
        },
        "sasToken": {
            "type": "SecureString",
            "defaultValue": "data.azurerm_key_vault_secret.sastoken.value",
            "metadata": {
            "description": "SAS token for Azure Blob Storage"
        },    
        "snowflakeDatabase": {
            "type": "String",
            "defaultValue": "LANDING",
            "metadata": {
                "description": "Name of the target database in the Snowflake."
            }
        },    
        "snowflakeSchema": {
            "type": "String",
            "defaultValue": "RAINTREE",
            "metadata": {
                "description": "Name of the target schema in the Snowflake."
            }
        },
        "snowflakeTableName": {
            "type": "String",
            "defaultValue": "RBI_APTYPE",
            "metadata": {
                "description": "Name of the target table in the Snowflake."
            }
        },
        "snowflakePassword": {
            "type": "SecureString",
            "defaultValue": "data.azurerm_key_vault_secret.snowflakepassword.value",
            "metadata": {
            "description": "Snowflake password"
        },
        "vaults_ivy_kv_lakehouse_dev_name": {
            "defaultValue": "ivy-kv-dev",
            "type": "String"
        }
    },
    "variables": {
        "azureStorageLinkedServiceName": "AzureBlobStorage_Snowflake",
        "snowflakeLinkedServiceName": "Azure_Snowflake",
        "inputDatasetName": "azure_blob_source_dataset",
        "outputDatasetName": "snowflake_sink_dataset",
        "pipelineName": "copy_rbireferral_to_snowflake",
        "tenant_id": "04d6e0a5-c077-4729-a90e-9790d11d2389",
        "object_id": "163c85c7-05fa-4c43-adda-fd2752302d02"
    },
    "resources": [
        {
            "type": "Microsoft.KeyVault/vaults",
            "apiVersion": "2023-02-01",
            "name": "[parameters('vaults_ivy_kv_lakehouse_dev_name')]",
            "location": "eastus",
            "properties": {
                "sku": {
                    "family": "A",
                    "name": "standard"
                },
                "tenantId": "[variables('tenant_id')]",
                "accessPolicies": [
                    {
                        "tenantId": "[variables('tenant_id')]",
                        "objectId": "[variables('object_id')]",
                        "permissions": {
                            "certificates": [
                                "get",
                                "list"
                            ],
                            "keys": [
                                "get",
                                "list"
                            ],
                            "secrets": [
                                "get",
                                "list"
                            ]
                        }
                    }
                ],
                "enabledForDeployment": false,
                "enabledForDiskEncryption": false,
                "enabledForTemplateDeployment": false,
                "enableSoftDelete": true,
                "softDeleteRetentionInDays": 90,
                "vaultUri": "[concat('https://', parameters('vaults_ivy_kv_lakehouse_dev_name'), '.vault.azure.net/')]",
                "provisioningState": "Succeeded",
                "publicNetworkAccess": "Enabled"
            }
        },
        {
            "type": "Microsoft.DataFactory/factories",
            "apiVersion": "2020-05-01",
            "name": "[parameters('dataFactoryName')]",
            "location": "[parameters('dataFactoryLocation')]",
            "properties": {},
            "resources": [
                {
                    "type": "linkedservices",
                    "apiVersion": "2020-05-01",
                    "name": "[variables('azureStorageLinkedServiceName')]",
                    "dependsOn": [
                        "[parameters('dataFactoryName')]"
                    ],
                    "properties": {
                        "type": "AzureStorage",
                        "description": "Azure Storage linked service",
                        "typeProperties": {
                            "connectionString": {
                                "value": "[concat(parameters('azureStorage_connectionString'), ';SharedAccessSignature=', data.azurerm_key_vault_secret.sasToken.value)]",
                                "type": "SecureString"
                            }
                        }
                    }
                },
                {
                    "type": "linkedservices",
                    "apiVersion": "2020-05-01",
                    "name": "[variables('snowflakeLinkedServiceName')]",
                    "dependsOn": [
                        "[parameters('dataFactoryName')]"
                    ],
                    "properties": {
                        "type": "Snowflake",
                        "description": "Snowflake linked service",
                        "typeProperties": {
                            "connectionString": {
                                "value": "[parameters('snowflake_connectionString')]",
                                "type": "String"
                            },
                            "password": {
                                "value": "[parameters('snowflakePassword')]",
                                "type": "SecureString"
                            }
                        }
                    }
                }
            ]
        }
    ]
}
 
DEPLOY
}