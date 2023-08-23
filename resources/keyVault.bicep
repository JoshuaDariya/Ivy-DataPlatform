targetScope = 'resourceGroup'

param location string // TODO: Make the region config
param KeyVaultName string
param spObjectId string
param tenantId string 

// Key Vault 
resource keyVaultResourceName 'Microsoft.KeyVault/vaults@2021-11-01-preview' = {
  name: KeyVaultName
  location: location
  properties: {
    tenantId: tenantId
    accessPolicies: [{
      objectId: spObjectId  
      permissions: {
        keys: ['get', 'list']
        secrets: ['get', 'list']
      }
      tenantId: tenantId 
    }]    
    sku: {
      family: 'A'
      name: 'standard'
    }
  }
}
