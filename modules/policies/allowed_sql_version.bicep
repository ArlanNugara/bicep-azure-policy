targetScope = 'subscription'

param policyInputData object
param client string
output policyId string = allowed_sql_version_policy.id

resource allowed_sql_version_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-${policyInputData.name}'
  properties: {
    displayName: '${client}-${policyInputData.displayName}'
    policyType: 'Custom'
    mode: 'All'
    description: policyInputData.description
    metadata:{
      category: 'SQL'
    }
    parameters: {
      sqlVersionAllowedNames: {
        type: 'String'
        metadata: {
          description: 'Allowed SQL Version'
          displayName: 'Allowed SQL Version'
        }
        defaultValue: policyInputData.SQLVersion
      }
    }
    policyRule: {
      if: {
        allOf: [
          {
            field: 'type'
            equals: 'Microsoft.SQL/servers'
          }
          {
            not: {
              field: 'Microsoft.SQL/servers/version'
              equals: '[parameters(\'sqlVersionAllowedNames\')]'
            }
          }
        ]
      }
      then: {
        effect: policyInputData.effect
      }
    }
  }
}
