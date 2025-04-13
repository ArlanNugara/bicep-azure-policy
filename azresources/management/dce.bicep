targetScope = 'resourceGroup'

param location string
param dceName string
param defaultTags object

resource dce 'Microsoft.Insights/dataCollectionEndpoints@2023-03-11' = {
  name: dceName
  location: location
  properties: {}
  tags: union(defaultTags, {
    Type: 'Data Collection Endpoint'
  })
}

output dceId string = dce.id
output dcename string = dce.name
output dceLocation string = dce.location
