targetScope = 'subscription'

param client string
output policyId string = lt1_azure_defender_for_sql_should_be_enabled_for_unprotected_sql_managed_instances_policy.id
resource lt1_azure_defender_for_sql_should_be_enabled_for_unprotected_sql_managed_instances_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-Azure Defender for SQL should be enabled for unprotected SQL Managed Instances'
  properties: {
    displayName: '${client}-Azure Defender for SQL should be enabled for unprotected SQL Managed Instances'
    policyType: 'Custom'
    mode: 'Indexed'
    description: 'Audit each SQL Managed Instance without advanced data security.'
    metadata: {
      version: '1.0.2'
      category: 'SQL'
    }
    policyRule: {
      if: {
        field: 'type'
        equals: 'Microsoft.Sql/managedInstances'
      }
      then: {
        effect: 'AuditIfNotExists'
        details: {
          type: 'Microsoft.Sql/managedInstances/securityAlertPolicies'
          name: 'Default'
          existenceCondition: {
            field: 'Microsoft.Sql/managedInstances/securityAlertPolicies/state'
            equals: 'Enabled'
          }
        }
      }
    }
  }
}
