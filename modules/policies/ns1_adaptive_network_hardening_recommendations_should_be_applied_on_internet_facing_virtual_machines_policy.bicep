targetScope = 'subscription'

param policyInputData object
param client string
output policyId string = ns1_adaptive_network_hardening_recommendations_should_be_applied_on_internet_facing_virtual_machines_policy.id

resource ns1_adaptive_network_hardening_recommendations_should_be_applied_on_internet_facing_virtual_machines_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-'
  properties: {
    displayName: '${client}-'
    policyType: 'Custom'
    mode: 'All'
    description: 'Azure Security Center analyzes the traffic patterns of Internet facing virtual machines and provides Network Security Group rule recommendations that reduce the potential attack surface'
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
        equals: 'Microsoft.Compute/virtualMachines'
      }
      then: {
        effect: 'AuditIfNotExists'
        details: {
          type: 'Microsoft.Security/assessments'
          name: 'f9f0eed0-f143-47bf-b856-671ea2eeed62'
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
