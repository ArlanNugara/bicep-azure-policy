targetScope = 'subscription'

param policyInputData object
param client string
output policyId string = diagnostic_setting_policy.id

resource diagnostic_setting_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-${policyInputData.name}'
  properties: {
    displayName: '${client}-${policyInputData.displayName}'
    policyType: 'Custom'
    mode: 'All'
    description: policyInputData.description
    metadata:{
      category: 'Monitoring'
    }
    parameters: {
      diagonosticSettingsAllowedNames: {
        type: 'Array'
        metadata: {
          description: 'Audit Diagonostic Settings'
          displayName: 'Audit Diagonostic Settings'
        }
        defaultValue: policyInputData.listOfDiagonosticSettings
      }
    }
    policyRule: {
      if: {
        field: 'type'
        in: '[parameters(\'diagonosticSettingsAllowedNames\')]'
      }
      then: {
        details: {
          existenceCondition: {
            allOf: [
              {
                equals: 'true'
                field: 'Microsoft.Insights/diagnosticSettings/logs.enabled'
              }
              {
                equals: 'true'
                field: 'Microsoft.Insights/diagnosticSettings/metrics.enabled'
              }
            ]
          }
          type: 'Microsoft.Insights/diagnosticSettings'
        }
        effect: policyInputData.effect
      }
    }
  }
}
