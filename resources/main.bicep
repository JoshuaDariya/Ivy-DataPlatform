targetScope='subscription'

param location string = 'eastus' // TODO: Make the region config
param rgName string = 'ivy-rg-lakehouse-dev'

resource rg 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: rgName // TODO: Make the environmentn name paramterized
  location: location
}

// TODO: Key Vault Goes Here as Module
// TODO: Roles and permissions
