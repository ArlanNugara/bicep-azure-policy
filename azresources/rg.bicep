targetScope = 'subscription'

param location string
param rgName string
param defaultTags object

resource resourceGroup 'Microsoft.Resources/resourceGroups@2024-03-01' = {
  location: location
  name: rgName

  tags: union(defaultTags, {
    Type: 'Resource Group'
  })
}

output outputRgName string = resourceGroup.name
output outputRgLocation string = resourceGroup.location
