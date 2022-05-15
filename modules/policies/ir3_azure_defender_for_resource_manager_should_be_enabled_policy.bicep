targetScope = 'subscription'

param client string
output policyId string = ir3_azure_defender_for_resource_manager_should_be_enabled_policy.id
resource ir3_azure_defender_for_resource_manager_should_be_enabled_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-Azure Defender for Resource Manager should be enabled'
  properties: {
    displayName: '${client}-Azure Defender for Resource Manager should be enabled'
    policyType: 'Custom'
    mode: 'All'
    description: 'Azure Defender for Resource Manager automatically monitors the resource management operations in your organization. Azure Defender detects threats and alerts you about suspicious activity. Learn more about the capabilities of Azure Defender for Resource Manager at https://aka.ms/defender-for-resource-manager . Enabling this Azure Defender plan results in charges. Learn about the pricing details per region on Security Center\'s pricing page: https://aka.ms/pricing-security-center .'
    metadata: {
      version: '1.0.0'
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
          name: 'Arm'
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
