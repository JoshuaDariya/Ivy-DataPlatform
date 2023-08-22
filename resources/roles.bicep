targetScope = 'resourceGroup'

// TODO: Roles and permissions
param rgName string
param roleName string = 'ReadRole'
param scope string

resource customRole 'Microsoft.Authorization/roleDefinitions@2022-04-01' = {
  name: guid(subscription().id, 'read', rgName)
  location: 'Global'
  properties: {
    roleName: roleName
    description: 'Custom read role'
    type: 'CustomRole'
    assignableScopes: [
      scope
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
