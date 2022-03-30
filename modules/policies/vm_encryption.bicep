targetScope = 'subscription'

param policyInputData object
param client string
output policyId string = vm_encryption_policy.id

resource vm_encryption_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-${policyInputData.name}'
  properties: {
    displayName: '${client}-${policyInputData.displayName}'
    policyType: 'Custom'
    mode: 'All'
    description: policyInputData.description
    metadata: {
      category: 'Compute'
    }
    parameters: {
      policyEffect: {
        type: 'String'
        metadata: {
          description: 'Policy Effect'
          displayName: 'The effect determines what happens when the policy rule is evaluated to match'
        }
        defaultValue: policyInputData.effect
      }
    }
    policyRule: {
      if: {
        anyOf: [
          {
            allOf: [
              {
                field: 'type'
                equals: 'Microsoft.Compute/virtualMachines'
              }
              {
                field: 'Microsoft.Compute/virtualMachines/securityProfile.encryptionAtHost'
                notEquals: true
              }
            ]
          }
          {
            allOf: [
              {
                field: 'type'
                equals: 'Microsoft.Compute/virtualMachineScaleSets'
              }
              {
                field: 'Microsoft.Compute/virtualMachineScaleSets/virtualMachineProfile.securityProfile.encryptionAtHost'
                notEquals: true
              }
            ]
          }
        ]
      }
      then: {
        effect: '[parameters(\'policyEffect\')]'
      }
    }
  }
}
