targetScope = 'resourceGroup'

// @description('Storage account type.')
// param storageAccountType string = 'Standard_LRS'

param location string = 'eastus' // TODO: Make the region config
param storageAccountName string = 'stivylakehousedev'
param storageAccountType string = 'Standard_LRS'
param KeyVaultName string = 'ivy-kv-lakehouse-dev'
param spObjectId string = 'e037cecc-a3a8-4f5e-9a9d-c0fbd9af41f9'


resource storageAccount 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: storageAccountName
  
  location: location
  sku: {
    name: storageAccountType
  }
  kind: 'StorageV2'
  properties: {}
}

// Key Vault 
resource keyVaultResourceName 'Microsoft.KeyVault/vaults@2021-04-01-preview' = {
  name: KeyVaultName
  location: location
  properties: {
    sku: {
      family: 'A'
      name: 'standard'
    }
    tenantId: subscription().tenantId
    accessPolicies: [
      {
        objectId: spObjectId 
        permissions: {
          keys: ['get', 'list']
          secrets: ['get', 'list']
        }
      }
    ]
    secretProperties: {
      keyPermissions: ['get', 'list']
      secretPermissions: ['get', 'list', 'set', 'delete', 'backup', 'restore'] 
    }
  }
}

// TODO: Roles and permissions
