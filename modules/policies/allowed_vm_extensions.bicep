targetScope = 'subscription'

param policyInputData object
param client string
output policyId string = allowed_vm_extensions_policy.id

resource allowed_vm_extensions_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-${policyInputData.name}'
  properties: {
    displayName: '${client}-${policyInputData.displayName}'
    policyType: 'Custom'
    mode: 'All'
    description: policyInputData.description
    metadata:{
      category:'Compute'
    }
    parameters: {
      vmExtensionsAllowedNames: {
        type: 'Array'
        metadata: {
          description: 'Allowed VM Extensions'
          displayName: 'Allowed VM Extensions'
        }
        defaultValue: policyInputData.listOfAllowedExtensions
      }
    }
    policyRule: {
      if: {
        allOf: [
          {
            field: 'type'
            equals: 'Microsoft.Compute/virtualMachines/extensions'
          }
          {
            field: 'Microsoft.Compute/virtualMachines/extensions/type'
            notIn: '[parameters(\'vmExtensionsAllowedNames\')]'
          }
        ]
      }
      then: {
        effect: policyInputData.effect
      }
    }
  }
}
