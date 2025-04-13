targetScope = 'resourceGroup'

param name string
param location string
param defaultTags object
param sku string

resource automationAccount 'Microsoft.Automation/automationAccounts@2023-11-01' = {
  name: name
  location: location
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    encryption: {
      keySource: 'Microsoft.Automation'
    }
    publicNetworkAccess: true
    sku: {
      name: sku
    }
  }
  tags: union(defaultTags, {
    Type: 'Automation Account'
  })
}

output aaName string = automationAccount.name
output aaId string = automationAccount.id
