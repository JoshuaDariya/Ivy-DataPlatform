
resource "azurerm_data_factory_dataset_azure_blob" "azure_blob_source_dataset" {
  name                = "rbi_referral_source"
  data_factory_id     = azurerm_data_factory.adf.id
  linked_service_name = azurerm_data_factory_linked_service_azure_blob_storage.linkedservice_azureblobstorage.name
  path  = "analytics/raw/raintree"
  filename = "rbi_referral.csv"
}

resource "azurerm_data_factory_dataset_snowflake" "snowflake_sink_dataset" {
  name                = "rbi_referral_destination"
  data_factory_id     = azurerm_data_factory.adf.id
  linked_service_name = azurerm_data_factory_linked_service_snowflake.linkedservice_snowflake.name
  schema_name         = "RAINTREE"
  table_name          = "RBI_REFERRAL"
}

resource "azurerm_resource_group_template_deployment" "armDeployment" {
  name                = "adf_arm_deploy"
  resource_group_name = azurerm_resource_group.rg_dataplatform_dev.name
  deployment_mode     = "Incremental"
    
  template_content =  <<TEMPLATE
{ 

    "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#",
    "contentVersion": "1.0.0.0",
    "parameters": {
        "dataFactoryName": {
            "type": "String",
              "defaultValue": "Ivy-dataplatform-test",
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
            "defaultValue": "${data.azurerm_storage_account.dw_storage_account.primary_connection_string}",
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
            "description": "SAS token for Azure Blob Storage
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
    },
    "variables": {
        "azureStorageLinkedServiceName": "AzureBlobStorage_Snowflake",
        "snowflakeLinkedServiceName": "Azure_Snowflake",
        "inputDatasetName": "azure_blob_source_dataset",
        "outputDatasetName": "snowflake_sink_dataset",
        "pipelineName": "copy_rbireferral_to_snowflake"
    },
    "resources": [
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
                },
                {
                    "type": "datasets",
                    "apiVersion": "2020-05-01",
                    "name": "[variables('inputDatasetName')]",
                    "dependsOn": [
                        "[parameters('dataFactoryName')]",
                        "[variables('azureStorageLinkedServiceName')]"
                    ],
                    "properties": {
                        "type": "AzureBlob",
                        "structure": [
                            {
                                "name": "Prop_0",
                                "type": "string"
                            },
                            {
                                "name": "Prop_1",
                                "type": "string"
                            },
                            {
#                               "name": "Prop_2",
                                "type": "string"
#                           },
#                           {
#                               "name": "Prop_3",
                                "type": "string"
#                           },
#                           {
#                               "name": "Prop_4",
                                "type": "string"
#                           },
#                           {
#                               "name": "Prop_5",
                                "type": "string"
#                           }
                        ],
                        "typeProperties": {
                            "format": {
                                "formatSettings": {
                #                     "type": "DelimitedTextReadSettings",
                #                     "skipLineCount": 0
                #                 },
                                "columnDelimiter": ";",
                #               "rowDelimiter": "\n",
                #               "encodingName": "iso-8859-1",
                #               "escapeChar": "\\",
                #               "firstRowAsHeader": false,
                #               "quoteChar": "",
                            },
                            "folderPath": "[concat(parameters('blobContainer'), '/', parameters('inputBlobFolder'), '/')]",
                            "fileName": "[parameters('inputBlobName')]"
                        },
                        "linkedServiceName": {
                            "referenceName": "[variables('azureStorageLinkedServiceName')]",
                            "type": "LinkedServiceReference"
                        }
                    }
                },
                {
                    "type": "datasets",
                    "apiVersion": "2020-05-01",
                    "name": "[variables('outputDatasetName')]",
                    "dependsOn": [
                        "[parameters('dataFactoryName')]",
                        "[variables('snowflakeLinkedServiceName')]"
                    ],
                    "properties": {
                        "type": "SnowflakeTable",
                        "structure": [
                            {
                                "name": "code",
                                "type": "string"
                            },
                            {
                                "name": "desc_",
                                "type": "string"
                            },
                            {
                                "name": "visit_type",
                                "type": "string"
                            },
                            {
                                "name": "slot",
                                "type": "string"
                            },
                            {
                                "name": "limit_",
                                "type": "string"
                            },
                            {
                                "name": "databasename",
                                "type": "string"
                            }
                        ],
                        "typeProperties": {
                            "tableName": {
                                "value": "[parameters('snowflakeDatabase')].[parameters('snowflakeSchema')].[parameters('snowflakeTableName')]",
                                "type": "Expression"
                            }
                        },
                        "linkedServiceName": {
                            "referenceName": "[variables('snowflakeLinkedServiceName')]",
                            "type": "LinkedServiceReference"
                        }
                    }
                },
                {
                    "type": "pipelines",
                    "apiVersion": "2020-05-01",
                    "name": "[variables('pipelineName')]",
                    "dependsOn": [
                        "[parameters('dataFactoryName')]",
                        "[variables('inputDatasetName')]",
                        "[variables('outputDatasetName')]"
                    ],
                    "properties": {
                        "activities": [
                            {
                                "type": "Copy",
                                "typeProperties": {
                                    "source": {
                                        "type": "BlobSource",
                                        "recursive": true
                                    },
                                    "sink": {
                                        "type": "SnowflakeSink",
                                        "preCopyScript": "Truncate table RAINTREE.RBI_APTYPE",
                                    }
                                },
                                "name": "copy_rbiaptype_to_snowflake",
                                "inputs": [
                                    {
                                        "referenceName": "[variables('inputDatasetName')]",
                                        "type": "DatasetReference"
                                    }
                                ],
                                "outputs": [
                                    {
                                        "referenceName": "[variables('outputDatasetName')]",
                                        "type": "DatasetReference"
                                    }
                                ]
                            }
                        ]
                    }
                }
            ]
        }
    ]
}
 
TEMPLATE
}