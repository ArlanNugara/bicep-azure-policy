targetScope = 'subscription'

param policyInputData object
param client string
output policyId string = allowed_vms_sku_policy.id

resource allowed_vms_sku_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-${policyInputData.name}'
  properties: {
    displayName: '${client}-${policyInputData.displayName}'
    policyType: 'Custom'
    mode: 'All'
    description: policyInputData.description
    metadata:{
      category: 'Compute'
    }
    parameters: {
      vmSKUsAllowedNames: {
        type: 'Array'
        metadata: {
          description: 'Allowed VM SKUs'
          displayName: 'Allowed VM SKUs'
        }
        defaultValue: policyInputData.listOfAllowedSKUs
      }
    }
    policyRule: {
      if: {
        allOf: [
          {
            field: 'type'
            equals: 'Microsoft.Compute/virtualMachines'
          }
          {
            not: {
              field: 'Microsoft.Compute/virtualMachines/sku.name'
              in: '[parameters(\'vmSKUsAllowedNames\')]'
            }
          }
        ]
      }
      then: {
        effect: policyInputData.effect
      }
    }
  }
}
