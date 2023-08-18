targetScope = 'resourceGroup'

param location string = 'eastus' // TODO: Make the region config
param KeyVaultName string = 'ivy-kv-lakehouse-dev'
param spObjectId string = 'e037cecc-a3a8-4f5e-9a9d-c0fbd9af41f9'
param tenantId string = '04d6e0a5-c077-4729-a90e-9790d11d2389'
// param tenantId string


// Key Vault 
resource keyVaultResourceName 'Microsoft.KeyVault/vaults@2021-04-01-preview' = {
  name: KeyVaultName
  location: location
  properties: {
    sku: {
      family: 'A'
      name: 'standard'
    }
    accessPolicies: [{
      objectId: spObjectId  
      permissions: {
        keys: ['get', 'list']
        secrets: ['get', 'list']
      }
      tenantId: tenantId 
    }]
    secretProperties: {
      keyPermissions: ['get', 'list']
      secretPermissions: ['get', 'list', 'set', 'delete', 'backup', 'restore'] 
    }
  }
}
