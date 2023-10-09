
//------------- TERRAFORM ACCOUNT WITH AZURE -----------------
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg_dev" {
    location = "East US"
    name = "rg-ivydataplatform-dev-eastus"
}

resource "azurerm_data_factory" "adf" {
  name                = "Ivy-dataplatform-test"
  location            = azurerm_resource_group.rg_dev.location
  resource_group_name = azurerm_resource_group.rg_dev.name
}

resource "azurerm_data_factory_pipeline" "pipeline_rib_referral" {
  name            = "pipeline_rib_referral"
  data_factory_id = azurerm_data_factory.adf.id
  activities_json = <<JSON
[
    {
        "name": "copy_rbireferral_test",
        "type": "Copy",
        "dependsOn": [],
        "policy": {
                    "timeout": "0.12:00:00",
                    "retry": 0,
                    "retryIntervalInSeconds": 30,
                    "secureOutput": false,
                    "secureInput": false
                },
        "userProperties": [
                    {
                        "name": "Source",
                        "value": "analytics/raw/raintree/rbi_insur.csv"
                    },
                    {
                        "name": "Destination",
                        "value": "PUBLIC.RBI_INSUR"
                    }
                ],
        "typeProperties": {
                    "source": {
                        "type": "DelimitedTextSource",
                        "storeSettings": {
                            "type": "AzureBlobStorageReadSettings",
                            "recursive": true,
                            "enablePartitionDiscovery": false
                        },
                        "formatSettings": {
                            "type": "DelimitedTextReadSettings",
                            "skipLineCount": 0
                        }
                    },
                    "sink": {
                        "type": "SnowflakeSink",
                        "preCopyScript": "Truncate table RAINTREE.RBI_REFERRAL",
                        "importSettings": {
                            "type": "SnowflakeImportCopyCommand"
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
                },
                "inputs": [
                    {
                        "referenceName": "rbi_referral_source",
                        "type": "DatasetReference"
                    }
                ],
                "outputs": [
                    {
                        "referenceName": "rbi_referral_destination",
                        "type": "DatasetReference"
                    }
                ]
            
    }
]
  JSON
}