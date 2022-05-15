targetScope = 'subscription'

param client string
output policyId string = ns5_azure_ddos_protection_standard_should_be_enabled_policy.id
resource ns5_azure_ddos_protection_standard_should_be_enabled_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-Azure DDoS Protection Standard should be enabled'
  properties: {
    displayName: '${client}-Azure DDoS Protection Standard should be enabled'
    policyType: 'Custom'
    mode: 'All'
    description: 'DDoS protection standard should be enabled for all virtual networks with a subnet that is part of an application gateway with a public IP.'
    metadata: {
      version: '3.0.0'
      category: 'Security Center'
    }
    policyRule: {
      if: {
        field: 'type'
        equals: 'microsoft.network/virtualNetworks'
      }
      then: {
        effect: 'AuditIfNotExists'
        details: {
          type: 'Microsoft.Security/assessments'
          name: 'e3de1cc0-f4dd-3b34-e496-8b5381ba2d70'
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
