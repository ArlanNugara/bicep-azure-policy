targetScope = 'subscription'

param client string
output policyId string = dp2_azure_defender_for_azure_sql_database_servers_should_be_enabled_policy.id
resource dp2_azure_defender_for_azure_sql_database_servers_should_be_enabled_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-Azure Defender for Azure SQL Database servers should be enabled'
  properties: {
    displayName: '${client}-Azure Defender for Azure SQL Database servers should be enabled'
    policyType: 'Custom'
    mode: 'All'
    description: 'Azure Defender for SQL provides functionality for surfacing and mitigating potential database vulnerabilities, detecting anomalous activities that could indicate threats to SQL databases, and discovering and classifying sensitive data.'
    metadata: {
      version: '1.0.2'
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
          name: 'SqlServers'
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
