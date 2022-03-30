targetScope = 'subscription'

param policyInputData object
param client string
output policyId string = nsg_inbound_rules_policy.id

resource nsg_inbound_rules_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-${policyInputData.name}'
  properties: {
    displayName: '${client}-${policyInputData.displayName}'
    policyType: 'Custom'
    mode: 'All'
    description: policyInputData.description
    metadata: {
      category: 'Networking'
    }
    parameters: {
      nsgInboundRuleAllowedNames: {
        type: 'String'
        metadata: {
          description: 'Audit NSG Inbound Rules'
          displayName: 'Enable or disable the execution of the policy'
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
        details: {
          type: 'Microsoft.Security/assessments'
          existenceCondition: {
            field: 'Microsoft.Security/assessments/status.code'
            in: [
              'Healthy'
              'NotApplicable'
              'Unhealthy'
            ]
          }
        }
        effect: '[parameters(\'nsgInboundRuleAllowedNames\')]'
      }
    }
  }
}
