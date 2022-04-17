targetScope = 'subscription'

param policyInputData object
param client string
output policyId string = lt1_azure_defender_for_key_vault_should_be_enabled_policy.id

resource lt1_azure_defender_for_key_vault_should_be_enabled_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-'
  properties: {
    displayName: '${client}-'
    policyType: 'Custom'
    mode: 'All'
    description: 'Azure Defender for Key Vault provides an additional layer of protection and security intelligence by detecting unusual and potentially harmful attempts to access or exploit key vault accounts.'
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
          name: 'KeyVaults'
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
