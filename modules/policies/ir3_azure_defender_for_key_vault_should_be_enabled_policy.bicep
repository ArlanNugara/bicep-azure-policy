targetScope = 'subscription'

param client string
output policyId string = ir3_azure_defender_for_key_vault_should_be_enabled_policy.id
resource ir3_azure_defender_for_key_vault_should_be_enabled_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-Azure Defender for Key Vault should be enabled'
  properties: {
    displayName: '${client}-Azure Defender for Key Vault should be enabled'
    policyType: 'Custom'
    mode: 'All'
    description: 'Azure Defender for Key Vault provides an additional layer of protection and security intelligence by detecting unusual and potentially harmful attempts to access or exploit key vault accounts.'
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
