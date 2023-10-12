
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

resource "azurerm_data_factory_pipeline" "pipeline_rib_referral" {
  name            = "pipeline_rib_referral"
  data_factory_id = azurerm_data_factory.adf.id
  activities_json = <<JSON
[
    {
        "name": "copy_rbireferral_to_snowflake",
        "type": "Copy",
        "dependsOn": [],
        "policy": {
                    "timeout": "0.12:00:00",
                    "retry": 0,
                    "retryIntervalInSeconds": 30,
                    "secureOutput": false,
                    "secureInput": false
                },
        "typeProperties": {
                    "source": {
                        "type": "AzureBlobSource",
                        "linkedServiceName": {
                            "referenceName": "linkedservice_azureblobstorage",
                            "type": "LinkedServiceReference"
                        },
                        "dataset": {
                            "referenceName": "azurerm_data_factory_dataset_azure_blob.azure_blob_source_dataset.name",
                            "type": "DatasetReference"
                        },
                        "storeSettings": {
                            "type": "AzureBlobStorageReadSettings",
                            "recursive": true,
                            "enablePartitionDiscovery": false
                        },
                        "formatSettings": {
                            "type": "DelimitedTextReadSettings",
                            "skipLineCount": 0
                        },
                        "columnDelimiter": ";",
                        "rowDelimiter": "\n",
                        "encodingName": "iso-8859-1",
                        "escapeChar": "\\",
                        "firstRowAsHeader": false,
                        "quoteChar": "",
                        "schema": [
                            {
                                "type": "String"
                            },
                            {
                                "type": "String"
                            },
                            {
                                "type": "String"
                            },
                            {
                                "type": "String"
                            },
                            {
                                "type": "String"
                            },
                            {
                                "type": "String"
                            },
                            {
                                "type": "String"
                            },
                            {
                                "type": "String"
                            },
                            {
                                "type": "String"
                            },
                            {
                                "type": "String"
                            },
                            {
                                "type": "String"
                            },
                            {
                                "type": "String"
                            },
                            {
                                "type": "String"
                            },
                            {
                                "type": "String"
                            },
                            {
                                "type": "String"
                            },
                            {
                                "type": "String"
                            },
                            {
                                "type": "String"
                            },
                            {
                                "type": "String"
                            },
                            {
                                "type": "String"
                            },
                            {
                                "type": "String"
                            },
                            {
                                "type": "String"
                            },
                            {
                                "type": "String"
                            },
                            {
                                "type": "String"
                            },
                            {
                                "type": "String"
                            },
                            {
                                "type": "String"
                            },
                            {
                                "type": "String"
                            },
                            {
                                "type": "String"
                            },
                            {
                                "type": "String"
                            },
                            {
                                "type": "String"
                            },
                            {
                                "type": "String"
                            },
                            {
                                "type": "String"
                            },
                            {
                                "type": "String"
                            },
                            {
                                "type": "String"
                            },
                            {
                                "type": "String"
                            },
                            {
                                "type": "String"
                            },
                            {
                                "type": "String"
                            },
                            {
                                "type": "String"
                            },
                            {
                                "type": "String"
                            },
                            {
                                "type": "String"
                            },
                            {
                                "type": "String"
                            }
                        ]
                    },
                    "sink": {
                        "type": "SnowflakeSink",
                        "linkedServiceName": {
                            "referenceName": "linkedservice_snowflake",
                            "type": "LinkedServiceReference"
                        },
                        "dataset": {
                            "referenceName": "azurerm_data_factory_dataset_snowflake.snowflake_sink_dataset.name",
                            "type": "DatasetReference"
                        },
                        "schema": [
                            {
                                "name": "ID",
                                "type": "NUMBER",
                                "precision": 38,
                                "scale": 0
                            },
                            {
                                "name": "PN",
                                "type": "VARCHAR",
                                "precision": 0,
                                "scale": 0
                            },
                            {
                                "name": "BC",
                                "type": "VARCHAR",
                                "precision": 0,
                                "scale": 0
                            },
                            {
                                "name": "GUID",
                                "type": "VARCHAR",
                                "precision": 0,
                                "scale": 0
                            },
                            {
                                "name": "CODE",
                                "type": "VARCHAR",
                                "precision": 0,
                                "scale": 0
                            },
                            {
                                "name": "CASE_CODE",
                                "type": "VARCHAR",
                                "precision": 0,
                                "scale": 0
                            },
                            {
                                "name": "INAME",
                                "type": "VARCHAR",
                                "precision": 0,
                                "scale": 0
                            },
                            {
                                "name": "FC",
                                "type": "VARCHAR",
                                "precision": 0,
                                "scale": 0
                            },
                            {
                                "name": "FDATE",
                                "type": "VARCHAR",
                                "precision": 0,
                                "scale": 0
                            },
                            {
                                "name": "EDATE",
                                "type": "VARCHAR",
                                "precision": 0,
                                "scale": 0
                            },
                            {
                                "name": "REL",
                                "type": "VARCHAR",
                                "precision": 0,
                                "scale": 0
                            },
                            {
                                "name": "COPAY",
                                "type": "VARCHAR",
                                "precision": 0,
                                "scale": 0
                            },
                            {
                                "name": "COPAY_TYPE",
                                "type": "VARCHAR",
                                "precision": 0,
                                "scale": 0
                            },
                            {
                                "name": "SUPPRESS",
                                "type": "VARCHAR",
                                "precision": 0,
                                "scale": 0
                            },
                            {
                                "name": "DEDUCT",
                                "type": "NUMBER",
                                "precision": 38,
                                "scale": 0
                            },
                            {
                                "name": "DEDUCT_MET",
                                "type": "NUMBER",
                                "precision": 38,
                                "scale": 0
                            },
                            {
                                "name": "DEDUCT_REM",
                                "type": "NUMBER",
                                "precision": 38,
                                "scale": 0
                            },
                            {
                                "name": "DEDUCT_DATE",
                                "type": "VARCHAR",
                                "precision": 0,
                                "scale": 0
                            },
                            {
                                "name": "DEDUCT_REFRESH_DATE",
                                "type": "VARCHAR",
                                "precision": 0,
                                "scale": 0
                            },
                            {
                                "name": "DEDUCTIS_MET",
                                "type": "NUMBER",
                                "precision": 38,
                                "scale": 0
                            },
                            {
                                "name": "AMOUNTS_VERIFIED_DATE",
                                "type": "VARCHAR",
                                "precision": 0,
                                "scale": 0
                            },
                            {
                                "name": "AUTH_REQ",
                                "type": "NUMBER",
                                "precision": 38,
                                "scale": 0
                            },
                            {
                                "name": "OVR_AUTH_REQ",
                                "type": "NUMBER",
                                "precision": 38,
                                "scale": 0
                            },
                            {
                                "name": "SUP_REASON_CB",
                                "type": "VARCHAR",
                                "precision": 0,
                                "scale": 0
                            },
                            {
                                "name": "MAX_OUT_POCK_REM",
                                "type": "VARCHAR",
                                "precision": 0,
                                "scale": 0
                            },
                            {
                                "name": "CC_AS_OF",
                                "type": "VARCHAR",
                                "precision": 0,
                                "scale": 0
                            },
                            {
                                "name": "ECODE",
                                "type": "VARCHAR",
                                "precision": 0,
                                "scale": 0
                            },
                            {
                                "name": "ENAME",
                                "type": "VARCHAR",
                                "precision": 0,
                                "scale": 0
                            },
                            {
                                "name": "EADDR1",
                                "type": "VARCHAR",
                                "precision": 0,
                                "scale": 0
                            },
                            {
                                "name": "EADDR2",
                                "type": "VARCHAR",
                                "precision": 0,
                                "scale": 0
                            },
                            {
                                "name": "ECITY",
                                "type": "VARCHAR",
                                "precision": 0,
                                "scale": 0
                            },
                            {
                                "name": "ESTATE",
                                "type": "VARCHAR",
                                "precision": 0,
                                "scale": 0
                            },
                            {
                                "name": "EZIP",
                                "type": "VARCHAR",
                                "precision": 0,
                                "scale": 0
                            },
                            {
                                "name": "EPHONE",
                                "type": "VARCHAR",
                                "precision": 0,
                                "scale": 0
                            },
                            {
                                "name": "ECELL",
                                "type": "VARCHAR",
                                "precision": 0,
                                "scale": 0
                            },
                            {
                                "name": "EFAX",
                                "type": "VARCHAR",
                                "precision": 0,
                                "scale": 0
                            },
                            {
                                "name": "EEMAIL",
                                "type": "VARCHAR",
                                "precision": 0,
                                "scale": 0
                            },
                            {
                                "name": "SSID",
                                "type": "VARCHAR",
                                "precision": 0,
                                "scale": 0
                            },
                            {
                                "name": "GROUP_ID",
                                "type": "VARCHAR",
                                "precision": 0,
                                "scale": 0
                            },
                            {
                                "name": "REF_REQ",
                                "type": "NUMBER",
                                "precision": 38,
                                "scale": 0
                            }
                        ],
                        "preCopyScript": {
                            "type": "SnowflakeSqlScript",
                            "script": "TRUNCATE TABLE RAINTREE.RBI_REFERRAL"
                        }
                    },
                    "enableStaging": false,
                    "translator": {
                        "type": "TabularTranslator",
                        "mappings": [
                            {
                                "source": {
                                    "type": "String",
                                    "ordinal": 1
                                },
                                "sink": {
                                    "name": "ID",
                                    "type": "Int64"
                                }
                            },
                            {
                                "source": {
                                    "type": "String",
                                    "ordinal": 2
                                },
                                "sink": {
                                    "name": "REFERRAL_CODE",
                                    "type": "String"
                                }
                            },
                            {
                                "source": {
                                    "type": "String",
                                    "ordinal": 3
                                },
                                "sink": {
                                    "name": "REFERRAL_FIRST_NAME",
                                    "type": "String"
                                }
                            },
                            {
                                "source": {
                                    "type": "String",
                                    "ordinal": 4
                                },
                                "sink": {
                                    "name": "REFERRAL_LAST_NAME",
                                    "type": "String"
                                }
                            },
                            {
                                "source": {
                                    "type": "String",
                                    "ordinal": 5
                                },
                                "sink": {
                                    "name": "REFERRAL_MID_NAME",
                                    "type": "String"
                                }
                            },
                            {
                                "source": {
                                    "type": "String",
                                    "ordinal": 6
                                },
                                "sink": {
                                    "name": "REFERRAL_CREDENTIALS",
                                    "type": "String"
                                }
                            },
                            {
                                "source": {
                                    "type": "String",
                                    "ordinal": 7
                                },
                                "sink": {
                                    "name": "REFERRAL_SPECIAL",
                                    "type": "String"
                                }
                            },
                            {
                                "source": {
                                    "type": "String",
                                    "ordinal": 8
                                },
                                "sink": {
                                    "name": "REFERRAL_GROUP",
                                    "type": "String"
                                }
                            },
                            {
                                "source": {
                                    "type": "String",
                                    "ordinal": 9
                                },
                                "sink": {
                                    "name": "REFERRAL_ORG",
                                    "type": "String"
                                }
                            },
                            {
                                "source": {
                                    "type": "String",
                                    "ordinal": 10
                                },
                                "sink": {
                                    "name": "REFERRAL_ADDR",
                                    "type": "String"
                                }
                            },
                            {
                                "source": {
                                    "type": "String",
                                    "ordinal": 11
                                },
                                "sink": {
                                    "name": "REFERRAL_ADDR2",
                                    "type": "String"
                                }
                            },
                            {
                                "source": {
                                    "type": "String",
                                    "ordinal": 12
                                },
                                "sink": {
                                    "name": "REFERRAL_CITY",
                                    "type": "String"
                                }
                            },
                            {
                                "source": {
                                    "type": "String",
                                    "ordinal": 13
                                },
                                "sink": {
                                    "name": "REFERRAL_STATE",
                                    "type": "String"
                                }
                            },
                            {
                                "source": {
                                    "type": "String",
                                    "ordinal": 14
                                },
                                "sink": {
                                    "name": "REFERRAL_ZIP",
                                    "type": "String"
                                }
                            },
                            {
                                "source": {
                                    "type": "String",
                                    "ordinal": 15
                                },
                                "sink": {
                                    "name": "REFERRALPHONE1",
                                    "type": "String"
                                }
                            },
                            {
                                "source": {
                                    "type": "String",
                                    "ordinal": 16
                                },
                                "sink": {
                                    "name": "REFERRALPHONE2",
                                    "type": "String"
                                }
                            },
                            {
                                "source": {
                                    "type": "String",
                                    "ordinal": 17
                                },
                                "sink": {
                                    "name": "REFERRALPHONE3",
                                    "type": "String"
                                }
                            },
                            {
                                "source": {
                                    "type": "String",
                                    "ordinal": 18
                                },
                                "sink": {
                                    "name": "REFERRAL_CONTACT",
                                    "type": "String"
                                }
                            },
                            {
                                "source": {
                                    "type": "String",
                                    "ordinal": 19
                                },
                                "sink": {
                                    "name": "REFERRALE_MAIL",
                                    "type": "String"
                                }
                            },
                            {
                                "source": {
                                    "type": "String",
                                    "ordinal": 20
                                },
                                "sink": {
                                    "name": "REFERRAL_PASSWORD",
                                    "type": "String"
                                }
                            },
                            {
                                "source": {
                                    "type": "String",
                                    "ordinal": 21
                                },
                                "sink": {
                                    "name": "LIC1",
                                    "type": "String"
                                }
                            },
                            {
                                "source": {
                                    "type": "String",
                                    "ordinal": 22
                                },
                                "sink": {
                                    "name": "LIC2",
                                    "type": "String"
                                }
                            },
                            {
                                "source": {
                                    "type": "String",
                                    "ordinal": 23
                                },
                                "sink": {
                                    "name": "LIC3",
                                    "type": "String"
                                }
                            },
                            {
                                "source": {
                                    "type": "String",
                                    "ordinal": 24
                                },
                                "sink": {
                                    "name": "LIC4",
                                    "type": "String"
                                }
                            },
                            {
                                "source": {
                                    "type": "String",
                                    "ordinal": 25
                                },
                                "sink": {
                                    "name": "TAXCODE",
                                    "type": "String"
                                }
                            },
                            {
                                "source": {
                                    "type": "String",
                                    "ordinal": 26
                                },
                                "sink": {
                                    "name": "TAXID",
                                    "type": "String"
                                }
                            },
                            {
                                "source": {
                                    "type": "String",
                                    "ordinal": 27
                                },
                                "sink": {
                                    "name": "REFERRAL_NAME",
                                    "type": "String"
                                }
                            }
                        ]
                    },
                    "escapeQuoteEscaping": true
                }
    }
]
  JSON
}