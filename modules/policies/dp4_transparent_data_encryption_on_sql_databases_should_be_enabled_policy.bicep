targetScope = 'subscription'

param client string
output policyId string = dp4_transparent_data_encryption_on_sql_databases_should_be_enabled_policy.id
resource dp4_transparent_data_encryption_on_sql_databases_should_be_enabled_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-Transparent Data Encryption on SQL databases should be enabled'
  properties: {
    displayName: '${client}-Transparent Data Encryption on SQL databases should be enabled'
    policyType: 'Custom'
    mode: 'Indexed'
    description: 'Transparent data encryption should be enabled to protect data-at-rest and meet compliance requirements'
    metadata: {
      version: '2.0.0'
      category: 'SQL'
    }
    policyRule: {
      if: {
        allOf: [
          {
            field: 'type'
            equals: 'Microsoft.Sql/servers/databases'
          }
          {
            field: 'name'
            notEquals: 'master'
          }
        ]
      }
      then: {
        effect: 'AuditIfNotExists'
        details: {
          type: 'Microsoft.Sql/servers/databases/transparentDataEncryption'
          name: 'current'
          existenceCondition: {
            anyOf: [
              {
                field: 'Microsoft.Sql/transparentDataEncryption.status'
                equals: 'enabled'
              }
              {
                field: 'Microsoft.Sql/servers/databases/transparentDataEncryption/state'
                equals: 'enabled'
              }
            ]
          }
        }
      }
    }
  }
}
