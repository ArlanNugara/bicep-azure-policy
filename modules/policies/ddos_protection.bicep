targetScope = 'subscription'

param policyInputData object
param client string
output policyId string = ddos_protection_policy.id

resource ddos_protection_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-${policyInputData.name}'
  properties: {
    displayName: '${client}-${policyInputData.displayName}'
    policyType: 'Custom'
    mode: 'All'
    description: policyInputData.description
    metadata: {
      category: 'Network'
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
        allOf:[
        {
          field: 'type'
          equals: 'Microsoft.Network/virtualNetworks'
        }
        {
          anyOf:[
            {
              field: 'Microsoft.Network/virtualNetworks/enableDdosProtection'
              notEquals: true
            }
            {
              field: 'Microsoft.Network/virtualNetworks/ddosProtectionPlan'
              equals: ''
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
