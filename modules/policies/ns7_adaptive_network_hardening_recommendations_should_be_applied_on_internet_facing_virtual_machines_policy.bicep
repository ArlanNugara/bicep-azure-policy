targetScope = 'subscription'

param client string
output policyId string = ns7_adaptive_network_hardening_recommendations_should_be_applied_on_internet_facing_virtual_machines_policy.id
resource ns7_adaptive_network_hardening_recommendations_should_be_applied_on_internet_facing_virtual_machines_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-Adaptive network hardening recommendations should be applied on internet facing virtual machines'
  properties: {
    displayName: '${client}-Adaptive network hardening recommendations should be applied on internet facing virtual machines'
    policyType: 'Custom'
    mode: 'Indexed'
    description: 'Azure Security Center analyzes the traffic patterns of Internet facing virtual machines and provides Network Security Group rule recommendations that reduce the potential attack surface'
    metadata: {
      version: '3.0.0'
      category: 'Security Center'
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
