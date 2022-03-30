targetScope = 'subscription'

param policyInputData object
param client string
output policyId string = sql_database_tls_version_policy.id

resource sql_database_tls_version_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-${policyInputData.name}'
  properties: {
    displayName: '${client}-${policyInputData.displayName}'
    policyType: 'Custom'
    mode: 'All'
    description: policyInputData.description
    metadata: {
      category: 'SQL'
    }
    parameters: {
      policyEffect: {
        type: 'String'
        metadata: {
          description: 'Policy Effect'
          displayName: 'The effect determines what happens when the policy rule is evaluated to match'
        }
        defaultValue: policyInputData.effect
      }
      sqlDatabaseAllowedTLSVersion: {
        type: 'String'
        metadata: {
          description: 'SQL Database TLS version'
          displayName: 'SQL Database Allowed TLS version'
        }
        defaultValue: policyInputData.sqlDatabaseAllowedTLSVersion
      }
    }
    policyRule: {
      if: {
        allOf: [
          {
            field: 'type'
            equals: 'Microsoft.Sql/servers'
          }
          {
            anyOf: [
              {
                field: 'Microsoft.Sql/servers/minimalTlsVersion'
                exists: false
              }
              {
                field: 'Microsoft.Sql/servers/minimalTlsVersion'
                notEquals: '[parameters(\'sqlDatabaseAllowedTLSVersion\')]'
              }
            ]
          }
        ]
      }
      then: {
        effect: '[parameters(\'policyEffect\')]'
      }
    }
  }
}
