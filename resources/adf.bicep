@description('Data Factory Name')
param dataFactoryName string = 'Ivy-adf-main'

@description('Location of the data factory.')
param location string = 'East US'

resource adf 'Microsoft.DataFactory/factories@2018-06-01' = {
  name: dataFactoryName
  location: location
}
