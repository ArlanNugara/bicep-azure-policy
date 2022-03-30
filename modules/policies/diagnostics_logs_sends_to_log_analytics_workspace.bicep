targetScope = 'subscription'

param policyInputData object
param client string
output policyId string = diagnostics_logs_sends_to_log_analytics_workspace_policy.id

resource diagnostics_logs_sends_to_log_analytics_workspace_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-${policyInputData.name}'
  properties: {
    displayName: '${client}-${policyInputData.displayName}'
    policyType: 'Custom'
    mode: 'All'
    description: policyInputData.description
    metadata: {
      category: 'Monitoring'
    }
    parameters: {
      logAnalyticsWorkspaceAllowedNames: {
        type: 'String'
        metadata: {
          description: 'Select the Log Analytics workspace from dropdown list'
          displayName: 'Log Analytics workspace'
        }
        defaultValue: policyInputData.logAnalyticsWorkspace
      }
      auditAiagnosticSettingForSelectedResourceTypesAllowedNames: {
        type: 'Array'
        metadata: {
          description: 'Select the Log Analytics workspace from dropdown list'
          displayName: 'Log Analytics workspace'
        }
        defaultValue: policyInputData.listOfDiagonosticSettingsForResourceTypes
      }
    }
    policyRule: {
      if: {
        field: 'type'
        in: '[parameters(\'auditAiagnosticSettingForSelectedResourceTypesAllowedNames\')]'
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
              {
                field: 'Microsoft.Insights/diagnosticSettings/workspaceId'
                matchInsensitively: '[parameters(\'logAnalyticsWorkspaceAllowedNames\')]'
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
