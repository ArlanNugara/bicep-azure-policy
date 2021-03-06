targetScope = 'subscription'

param client string
output policyId string = ns10_azure_defender_for_dns_should_be_enabled_policy.id
resource ns10_azure_defender_for_dns_should_be_enabled_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-Azure Defender for DNS should be enabled'
  properties: {
    displayName: '${client}-Azure Defender for DNS should be enabled'
    policyType: 'Custom'
    mode: 'All'
    description: 'Azure Defender for DNS provides an additional layer of protection for your cloud resources by continuously monitoring all DNS queries from your Azure resources. Azure Defender alerts you about suspicious activity at the DNS layer. Learn more about the capabilities of Azure Defender for DNS at https://aka.ms/defender-for-dns . Enabling this Azure Defender plan results in charges. Learn about the pricing details per region on Security Center\'s pricing page: https://aka.ms/pricing-security-center .'
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
          name: 'Dns'
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
