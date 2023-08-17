targetScope = 'resourceGroup'

// @description('Storage account type.')
// param storageAccountType string = 'Standard_LRS'

param location string = 'eastus' // TODO: Make the region config
param storageAccountName string = 'stivylakehousedev'
param storageAccountType string = 'Standard_LRS'

resource storageAccount 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: storageAccountName
  
  location: location
  sku: {
    name: storageAccountType
  }
  kind: 'StorageV2'
  properties: {}
}



// TODO: Roles and permissions
