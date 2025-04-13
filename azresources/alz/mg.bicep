targetScope = 'managementGroup'

param mgs array

@batchSize(1)
resource firstLevelMG 'Microsoft.Management/managementGroups@2021-04-01' = [for mg in mgs: {
  name: mg.id
  scope: tenant()
  properties: {
    displayName: mg.displayName
    details: {
      parent: {
        id: '/providers/Microsoft.Management/managementGroups/${mg.parentId}'
      }
    }
  }
}]
