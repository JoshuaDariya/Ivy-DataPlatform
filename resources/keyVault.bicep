targetScope = 'resourceGroup'

param location string = 'eastus' // TODO: Make the region config
param KeyVaultName string = 'ivy-kv-lakehouse-dev'
param spObjectId string = 'e037cecc-a3a8-4f5e-9a9d-c0fbd9af41f9'
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
