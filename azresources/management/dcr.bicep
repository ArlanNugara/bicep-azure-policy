targetScope = 'resourceGroup'

param location string
param dcrName string
param dataFlow array
param dataSource object
param workspaceId string
param defaultTags object

resource dataCollectionRule 'Microsoft.Insights/dataCollectionRules@2021-04-01' = {
  location: location
  name: dcrName
  properties: {
    dataFlows: dataFlow
    dataSources: dataSource
    destinations: {
      logAnalytics: [
        {
          name: '${dcrName}-log'
          workspaceResourceId: workspaceId
        }
      ]
    }
  }
  tags: union(defaultTags, {
    Type: 'Data Collection Rules'
  })
}
