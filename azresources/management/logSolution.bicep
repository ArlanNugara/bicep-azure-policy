targetScope = 'resourceGroup'

param workspaceName string
param solutionName string
param location string
param workspaceId string
param defaultTags object

resource logAnalyticsWorkspaceSolutions 'Microsoft.OperationsManagement/solutions@2015-11-01-preview' = {
  name: '${solutionName}(${workspaceName})'
  location: location
  properties: {
    workspaceResourceId: workspaceId
  }
  plan: {
    name: '${solutionName}(${workspaceName})'
    product: 'OMSGallery/${solutionName}'
    publisher: 'Microsoft'
    promotionCode: ''
  }
  tags: union(defaultTags, {
    Type: 'Log Analytics Workspace Solution'
  })
}
