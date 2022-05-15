targetScope = 'subscription'

param client string
output policyId string = lt6_sql_servers_with_auditing_to_storage_account_destination_should_be_configured_with_90_days_retention_or_higher_policy.id
resource lt6_sql_servers_with_auditing_to_storage_account_destination_should_be_configured_with_90_days_retention_or_higher_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-SQL servers with auditing to storage account destination should be configured with 90 days retention or higher'
  properties: {
    displayName: '${client}-SQL servers with auditing to storage account destination should be configured with 90 days retention or higher'
    policyType: 'Custom'
    mode: 'Indexed'
    description: 'For incident investigation purposes, we recommend setting the data retention for your SQL Server\' auditing to storage account destination to at least 90 days. Confirm that you are meeting the necessary retention rules for the regions in which you are operating. This is sometimes required for compliance with regulatory standards.'
    metadata: {
      version: '3.0.0'
      category: 'SQL'
    }
    policyRule: {
      if: {
        allOf: [
          {
            field: 'type'
            equals: 'Microsoft.Sql/servers'
          }
          {
            field: 'kind'
            notContains: 'analytics'
          }
        ]
      }
      then: {
        effect: 'AuditIfNotExists'
        details: {
          type: 'Microsoft.Sql/servers/auditingSettings'
          name: 'default'
          existenceCondition: {
            anyOf: [
              {
                allOf: [
                  {
                    field: 'Microsoft.Sql/servers/auditingSettings/isAzureMonitorTargetEnabled'
                    equals: true
                  }
                  {
                    field: 'Microsoft.Sql/servers/auditingSettings/storageEndpoint'
                    equals: ''
                  }
                ]
              }
              {
                field: 'Microsoft.Sql/servers/auditingSettings/retentionDays'
                equals: 0
              }
              {
                field: 'Microsoft.Sql/servers/auditingSettings/retentionDays'
                greaterOrEquals: 90
              }
            ]
          }
        }
      }
    }
  }
}
