targetScope = 'subscription'

param client string
output policyId string = lt5_windows_machines_should_have_log_analytics_agent_installed_on_azure_arc_policy.id
resource lt5_windows_machines_should_have_log_analytics_agent_installed_on_azure_arc_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-Windows machines should have Log Analytics agent installed on Azure Arc'
  properties: {
    displayName: '${client}-Windows machines should have Log Analytics agent installed on Azure Arc'
    policyType: 'Custom'
    mode: 'Indexed'
    description: 'Machines are non-compliant if Log Analytics agent is not installed on Azure Arc enabled windows server.'
    metadata: {
      category: 'Guest Configuration'
      version: '2.0.0'
      requiredProviders: [
        'Microsoft.GuestConfiguration'
      ]
      guestConfiguration: {
        name: 'WindowsLogAnalyticsAgentInstalled'
        version: '1.*'
      }
    }
    parameters: {
      IncludeArcMachines: {
        type: 'String'
        metadata: {
          displayName: 'Include Arc connected servers'
          description: 'By selecting this option, you agree to be charged monthly per Arc connected machine.'
          portalReview: 'true'
        }
        allowedValues: [
          'true'
          'false'
        ]
        defaultValue: 'false'
      }
    }
    policyRule: {
      if: {
        allOf: [
          {
            value: '[parameters(\'IncludeArcMachines\')]'
            equals: 'true'
          }
          {
            field: 'type'
            equals: 'Microsoft.HybridCompute/machines'
          }
          {
            field: 'Microsoft.HybridCompute/imageOffer'
            like: 'windows*'
          }
        ]
      }
      then: {
        effect: 'AuditIfNotExists'
        details: {
          type: 'Microsoft.GuestConfiguration/guestConfigurationAssignments'
          name: 'WindowsLogAnalyticsAgentInstalled'
          existenceCondition: {
            field: 'Microsoft.GuestConfiguration/guestConfigurationAssignments/complianceStatus'
            equals: 'Compliant'
          }
        }
      }
    }
  }
}
