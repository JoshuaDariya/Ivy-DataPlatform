targetScope = 'resourceGroup'

// TODO: Roles and permissions
param rgName string = 'rg-ivydataplatform-dev-eastus'
param roleName string = 'ReadRole'

resource customRole 'Microsoft.Authorization/roleDefinitions@2021-04-01-preview' = {
  name: guid(subscription().id, 'read', rgName)
  location: 'Global'
  properties: {
    roleName: roleName
    description: 'Custom read role'
    type: 'CustomRole'
    assignableScopes: [
      resourceGroup(rgName)
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
