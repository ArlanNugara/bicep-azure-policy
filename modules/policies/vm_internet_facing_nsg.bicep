targetScope = 'subscription'

param policyInputData object
param client string
output policyId string = vm_internet_facing_nsg_policy.id

resource vm_internet_facing_nsg_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
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
        field: 'type'
        in: [
          'Microsoft.Compute/virtualMachines'
          'Microsoft.ClassicCompute/virtualMachines'
        ]
      }
      then: {
        effect: '[parameters(\'policyEffect\')]'
        details: {
          type: 'Microsoft.Security/assessments'
          name: '483f12ed-ae23-447e-a2de-a67a10db4353'
          existenceCondition: {
            field: 'Microsoft.Security/assessments/status.code'
            in: [
              'NotApplicable'
              'Healthy'
            ]
          }
        }
      }
    }
  }
}
