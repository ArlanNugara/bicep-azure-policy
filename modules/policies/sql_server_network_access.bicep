targetScope = 'subscription'

param policyInputData object
param client string
output policyId string = sql_server_network_access_policy.id

resource sql_server_network_access_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
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
    }
    policyRule: {
      if: {
        allOf: [
          {
            field: 'type'
            equals: 'Microsoft.Sql/servers'
          }
          {
            field: 'Microsoft.Sql/servers/publicNetworkAccess'
            notEquals: 'Disabled'
          }
        ]
      }
      then: {
        effect: '[parameters(\'policyEffect\')]'
      }
    }
  }
}
