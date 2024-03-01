targetScope = 'resourceGroup'

param location string // TODO: Make the region config
param KeyVaultName string
param spObjectId string
param adfObjectId string
param tenantId string 

// Key Vault 
resource keyVaultResourceName 'Microsoft.KeyVault/vaults@2021-11-01-preview' = {
  name: KeyVaultName
  location: location
  properties: {
    sku: {
      family: 'A'
      name: 'standard'
    }
    tenantId: tenantId
    accessPolicies: [{
      objectId: spObjectId
      tenantId: tenantId   
      permissions: {
        keys: ['get', 'list']
        secrets: ['get', 'list']
      }
    }
      {
      objectId: adfObjectId
      tenantId: tenantId   
      permissions: {
        keys: ['get', 'list']
        secrets: ['get', 'list']
        certificates: ['get', 'list']
      }
      
    }]    
  }
}