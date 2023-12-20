targetScope = 'resourceGroup'

param functionAppName string
param functionStorageAccountName string
param location string 
param serviceAppName string


resource appServicePlan 'Microsoft.Web/serverfarms@2020-12-01' = {
  name: serviceAppName
  location: location
  sku: {
    name: 'Y1'
    tier: 'Dynamic'
  }
}

resource storageAccount 'Microsoft.Storage/storageAccounts@2019-06-01' = {
  name: functionStorageAccountName
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}

resource functionApp 'Microsoft.Web/sites@2020-12-01' = {
  name: functionAppName
  location: location
  properties: {
    serverFarmId: appServicePlan.id
    siteConfig: {
      appSettings: [
        {
          name: 'FUNCTIONS_WORKER_RUNTIME'
          value: 'python'
        }
      ]
    }
  }
  dependsOn: [
    appServicePlan
  ]
}

resource storageConnectionString 'Microsoft.Web/sites/config@2020-12-01' = {
  name: '${functionApp.name}/web'
  properties: {
    key: 'AzureWebJobsStorage'
    value: listKeys(storageAccount.id, '2019-06-01').keys[0].value
  }
  dependsOn: [
    functionApp
  ]
}

output endpoint string = functionApp.properties.defaultHostName
