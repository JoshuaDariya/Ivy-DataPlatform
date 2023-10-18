targetScope = 'resourceGroup'

// @description('Storage account type.')
// param storageAccountType string = 'Standard_LRS'

param location string // TODO: Make the region config
param storageAccountName string
param storageAccountType string = 'Standard_LRS'
param dataFactoryName string = 'Ivy-adf-main'

resource storageAccount 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: storageAccountName
  
  location: location
  sku: {
    name: storageAccountType
  }
  kind: 'StorageV2'
  properties: {}
}

resource dataFactory 'Microsoft.DataFactory/factories@2018-06-01' = {
  name: dataFactoryName
  location: location
  identity: {
    type: 'SystemAssigned'
  }
}

// TODO: Roles and permissions
