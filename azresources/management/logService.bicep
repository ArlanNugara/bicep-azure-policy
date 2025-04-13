targetScope = 'resourceGroup'

param name string
param aaId string
param defaultTags object

resource logAnalyticsLinkedService 'Microsoft.OperationalInsights/workspaces/linkedServices@2023-09-01' = {
  name: name
  properties: {
    resourceId: aaId
  }
  tags: union(defaultTags, {
    Type: 'Log Analytics Linked Service'
  })
}
