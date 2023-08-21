targetScope = 'resourceGroup'

// TODO: Roles and permissions
param rgName string = 'rg-ivydataplatform-dev-eastus'
param roleName string = 'ReadRole'

resource customRole 'Microsoft.Authorization/roleDefinitions@2022-04-01' = {
  name: guid(subscription().id, 'read', rgName)
  location: 'Global'
  properties: {
    roleName: roleName
    description: 'Custom read role'
    type: 'CustomRole'
    assignableScopes: [
      '/subscriptions/cbecafd1-1b42-4db3-a26a-e2851ce44268/resourcegroups/rg-ivydataplatform-dev-eastus'
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
