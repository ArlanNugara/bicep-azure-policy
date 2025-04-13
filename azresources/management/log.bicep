targetScope = 'resourceGroup'

param location string
param workspaceName string
param defaultTags object

resource workspace 'Microsoft.OperationalInsights/workspaces@2023-09-01' = {
  name: workspaceName
  location: location
  properties: {
    sku: {
      name: 'PerGB2018'
    }
    retentionInDays: 90
    workspaceCapping: {
      dailyQuotaGb: 1
    }
  }
  tags: union(defaultTags, {
    Type: 'Log Analytics Workspace'
  })
}

output lawId string = workspace.id
output lawName string = workspace.name
