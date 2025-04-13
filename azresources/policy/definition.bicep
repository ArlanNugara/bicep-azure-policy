targetScope = 'managementGroup'

param defName string
param displayName string
param mode string
param parameter object
param rule object

resource policyDefinition 'Microsoft.Authorization/policyDefinitions@2023-04-01' = {
  name: defName
  properties: {
    displayName: displayName
    mode: mode
    parameters: any(parameter)
    policyRule: any(rule)
    policyType: 'Custom'
  }
}

output outputPolicyDefId string = policyDefinition.id
output outputPolicyDefName string = policyDefinition.name
