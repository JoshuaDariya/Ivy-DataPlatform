targetScope = 'resourceGroup'

// @description('Storage account type.')
// param storageAccountType string = 'Standard_LRS'

param location string = 'eastus' // TODO: Make the region config
param storageAccountName string = 'stivylakehousedev'
param storageAccountType string = 'Standard_LRS'

// resource rg 'Microsoft.Resources/resourceGroups@2022-09-01' = {
//   name: rgName // TODO: Make the environmentn name paramterized
//   location: location
// }

resource storageAccount 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: storageAccountName
  
  location: location
  sku: {
    name: storageAccountType
  }
  kind: 'StorageV2'
  properties: {}
}


// TODO: Key Vault Goes Here as Module
// TODO: Roles and permissions
@description('Array of actions for the roleDefinition')
param actions array = [
  'Microsoft.Resources/subscriptions/resourceGroups/read'
]

@description('Array of notActions for the roleDefinition')
param notActions array = []

@description('Friendly name of the role definition')
param roleName string = 'Data Platform Reader'

@description('Detailed description of the role definition')
param roleDescription string = 'Subscription Level Deployment of a Role Definition'

var roleDefName = guid(subscription().id, string(actions), string(notActions))

resource roleDef 'Microsoft.Authorization/roleDefinitions@2018-07-01' = {
  name: roleDefName
  properties: {
    roleName: roleName
    description: roleDescription
    type: 'customRole'
    permissions: [
      {
        actions: actions
        notActions: notActions
      }
    ]
    assignableScopes: [
      subscription().id
    ]
  }
}
// TODO: Cost Controls
