targetScope = 'subscription'

param client string
output policyId string = ir5_azure_defender_for_open_source_relational_databases_should_be_enabled_policy.id
resource ir5_azure_defender_for_open_source_relational_databases_should_be_enabled_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-Azure Defender for open-source relational databases should be enabled'
  properties: {
    displayName: '${client}-Azure Defender for open-source relational databases should be enabled'
    policyType: 'Custom'
    mode: 'All'
    description: 'Azure Defender for open-source relational databases detects anomalous activities indicating unusual and potentially harmful attempts to access or exploit databases. Learn more about the capabilities of Azure Defender for open-source relational databases at https://aka.ms/AzDforOpenSourceDBsDocu. Important: Enabling this plan will result in charges for protecting your open-source relational databases. Learn about the pricing on Security Center\'s pricing page: https://aka.ms/pricing-security-center'
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
          name: 'OpenSourceRelationalDatabases'
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
