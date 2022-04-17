targetScope = 'subscription'

param policyInputData object
param client string
output policyId string = es1_azure_defender_for_servers_should_be_enabled_policy.id

resource es1_azure_defender_for_servers_should_be_enabled_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-'
  properties: {
    displayName: '${client}-'
    policyType: 'Custom'
    mode: 'All'
    description: 'Azure Defender for servers provides real-time threat protection for server workloads and generates hardening recommendations as well as alerts about suspicious activities.'
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
