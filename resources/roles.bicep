targetScope = 'resourceGroup'

// TODO: Roles and permissions
param rgName string = 'rg-ivydataplatform-dev-eastus'
param roleName string = 'ReadRole'
param devScope string

resource customRole 'Microsoft.Authorization/roleDefinitions@2022-04-01' = {
  name: guid(subscription().id, 'read', rgName)
  location: 'Global'
  properties: {
    roleName: roleName
    description: 'Custom read role'
    type: 'CustomRole'
    assignableScopes: [
      devScope
    ]
    permissions: [
      {
        actions: [
          'Microsoft.Resources/subscriptions/resourceGroups/read'
        ]
        notActions: []
      }
    ]
  }
}
