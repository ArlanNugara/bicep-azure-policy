targetScope = 'managementGroup'

param location string
param name string
param displayName string
param defId string
param roleId string
param parameters object = {}

resource policyAssignment 'Microsoft.Authorization/policyAssignments@2024-04-01' = {
  name: name
  properties: {
    assignmentType: 'Custom'
    displayName: displayName
    policyDefinitionId: defId
    notScopes: []
    parameters: parameters
    enforcementMode: 'Default'
  }
  identity: {
    type: 'SystemAssigned'
  }
  location: location
}

resource policyRoleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  name: guid(name, roleId)
  properties: {
    principalId: policyAssignment.identity.principalId
    roleDefinitionId: roleId
    principalType: 'ServicePrincipal'
  }
}

output outputPolicyAssignmentId string = policyAssignment.id
output outputPolicyAssignmentName string = policyAssignment.name
output outputPolicyAssignmentPricipalId string = policyAssignment.identity.principalId
