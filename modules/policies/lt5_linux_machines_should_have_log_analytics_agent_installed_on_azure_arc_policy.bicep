targetScope = 'subscription'

param policyInputData object
param client string
output policyId string = lt5_linux_machines_should_have_log_analytics_agent_installed_on_azure_arc_policy.id

resource lt5_linux_machines_should_have_log_analytics_agent_installed_on_azure_arc_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-'
  properties: {
    displayName: '${client}-'
    policyType: 'Custom'
    mode: 'All'
    description: 'Machines are non-compliant if Log Analytics agent is not installed on Azure Arc enabled Linux server.'
    metadata: {
      category: 'Networking'
    }
    parameters: {
      nsgInboundRuleAllowedNames: {
        type: 'String'
        metadata: {
          description: 'Audit NSG Inbound Rules'
          displayName: 'Enable or disable the execution of the policy'
        }
        defaultValue: policyInputData.effect
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
            like: 'linux*'
          }
        ]
      }
      then: {
        effect: 'AuditIfNotExists'
        details: {
          type: 'Microsoft.GuestConfiguration/guestConfigurationAssignments'
          name: 'LinuxLogAnalyticsAgentInstalled'
          existenceCondition: {
            field: 'Microsoft.GuestConfiguration/guestConfigurationAssignments/complianceStatus'
            equals: 'Compliant'
          }
        }
      }
    }
  }
}
