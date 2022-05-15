targetScope = 'subscription'

param client string
output policyId string = dp2_azure_defender_for_storage_should_be_enabled_policy.id
resource dp2_azure_defender_for_storage_should_be_enabled_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-Azure Defender for Storage should be enabled'
  properties: {
    displayName: '${client}-Azure Defender for Storage should be enabled'
    policyType: 'Custom'
    mode: 'All'
    description: 'Azure Defender for Storage provides detections of unusual and potentially harmful attempts to access or exploit storage accounts.'
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
          name: 'StorageAccounts'
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
