targetScope = 'managementGroup'

param defSetName string
param displayName string
param defList array

resource policySetDefinition 'Microsoft.Authorization/policySetDefinitions@2023-04-01' = {
  name: defSetName
  properties: {
    displayName: displayName
    policyDefinitions: defList
    policyType: 'Custom'
  }
}

output outputPolicySetDefId string = policySetDefinition.id
output outputPolicySetDefName string = policySetDefinition.name
