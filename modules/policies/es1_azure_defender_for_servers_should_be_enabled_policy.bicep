targetScope = 'subscription'

param client string
output policyId string = es1_azure_defender_for_servers_should_be_enabled_policy.id
resource es1_azure_defender_for_servers_should_be_enabled_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-Azure Defender for servers should be enabled'
  properties: {
    displayName: '${client}-Azure Defender for servers should be enabled'
    policyType: 'Custom'
    mode: 'All'
    description: 'Azure Defender for servers provides real-time threat protection for server workloads and generates hardening recommendations as well as alerts about suspicious activities.'
    metadata: {
      version: '1.0.3'
      category: 'Security Center'
    }
    policyRule: {
      if: {
        field: 'type'
        equals: 'Microsoft.Resources/subscriptions'
      }
      then: {
        effect: 'AuditIfNotExists'
        details: {
          type: 'Microsoft.Security/pricings'
          name: 'VirtualMachines'
          existenceScope: 'subscription'
          existenceCondition: {
            field: 'Microsoft.Security/pricings/pricingTier'
            equals: 'Standard'
          }
        }
      }
    }
  }
}
