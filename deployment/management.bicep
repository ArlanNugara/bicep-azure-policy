targetScope = 'subscription'

param managementRg object
param managementSubscriptionId string
param workspaces object
param dce object
param dcrs array
param aas object
param defaultTags object
param subMonitorLogsCategory array

// Log Analytics Workspace

module managementResourceGroup '../azresources/rg.bicep' = {
  name: 'deploy-rg-${managementRg.name}'
  scope: subscription(managementSubscriptionId)
  params: {
    location: managementRg.location
    rgName: managementRg.name
    defaultTags: defaultTags
  }
}

module logAnalyticsWorkspace '../azresources/management/log.bicep' = {
  name: 'deploy-log-${workspaces.name}'
  scope: resourceGroup(managementSubscriptionId, managementRg.name)
  params: {
    location: managementResourceGroup.outputs.outputRgLocation
    workspaceName: workspaces.name
    defaultTags: defaultTags
  }
}

module logAnalyticsWorkspaceSecuritySolution '../azresources/management/logSolution.bicep' = {
  name: 'deploy-log-solution-SecurityInsights'
  scope: resourceGroup(managementSubscriptionId, managementRg.name)
  params: {
    solutionName: 'SecurityInsights'
    workspaceName: logAnalyticsWorkspace.outputs.lawName
    location: managementResourceGroup.outputs.outputRgLocation
    workspaceId: logAnalyticsWorkspace.outputs.lawId
    defaultTags: defaultTags
  }
}

module logAnalyticsWorkspaceChangeTrackingSolution '../azresources/management/logSolution.bicep' = {
  name: 'deploy-log-solution-ChangeTracking'
  scope: resourceGroup(managementSubscriptionId, managementRg.name)
  params: {
    solutionName: 'ChangeTracking'
    workspaceName: logAnalyticsWorkspace.outputs.lawName
    location: managementResourceGroup.outputs.outputRgLocation
    workspaceId: logAnalyticsWorkspace.outputs.lawId
    defaultTags: defaultTags
  }
}

module automationAccounts '../azresources/management/aa.bicep' = {
  name: 'deploy-aa-${aas.name}'
  scope:resourceGroup(managementSubscriptionId, managementRg.name)
  params: {
    name: aas.name
    location: managementResourceGroup.outputs.outputRgLocation
    sku: aas.sku
    defaultTags: defaultTags
  }
}

module linkedService '../azresources/management/logService.bicep' = {
  name: 'deploy-linkedService-${aas.name}-${workspaces.name}'
  scope:resourceGroup(managementSubscriptionId, managementRg.name)
  params: {
    name: '${logAnalyticsWorkspace.outputs.lawName}/Automation'
    aaId: automationAccounts.outputs.aaId
    defaultTags: defaultTags
  }
}

module dataCollectionEndpoint '../azresources/management/dce.bicep' = {
  name: 'deploy-dce-${dce.name}'
  scope: resourceGroup(managementSubscriptionId, managementRg.name)
  params: {
    location: managementResourceGroup.outputs.outputRgLocation
    dceName: dce.name
    defaultTags: defaultTags
  }
}

module dataCollectionRules '../azresources/management/dcr.bicep' = [for dcr in dcrs: {
  name: 'deploy-dcr-${dcr.name}'
  scope:resourceGroup(managementSubscriptionId, managementRg.name)
  params: {
    dcrName: dcr.name
    location: managementResourceGroup.outputs.outputRgLocation
    workspaceId: logAnalyticsWorkspace.outputs.lawId
    dataFlow: dcr.dataFlow
    dataSource: dcr.dataSource
    defaultTags: defaultTags
  }
}]

resource subMonitor 'Microsoft.Insights/diagnosticSettings@2021-05-01-preview' = {
  name: 'activity-log-${managementSubscriptionId}'
  properties: {
    workspaceId: logAnalyticsWorkspace.outputs.lawId
    logs: subMonitorLogsCategory
  }
}
