targetScope = 'subscription'

param policyInputData object
param client string
output policyId string = lt5_log_analytics_agent_should_be_installed_on_your_virtual_machine_scale_sets_for_azure_security_center_monitoring_policy.id

resource lt5_log_analytics_agent_should_be_installed_on_your_virtual_machine_scale_sets_for_azure_security_center_monitoring_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-'
  properties: {
    displayName: '${client}-'
    policyType: 'Custom'
    mode: 'All'
    description: 'Security Center collects data from your Azure virtual machines (VMs) to monitor for security vulnerabilities and threats.'
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
        field: 'type'
        in: [
          'Microsoft.Compute/virtualMachineScaleSets'
        ]
      }
      then: {
        effect: 'AuditIfNotExists'
        details: {
          type: 'Microsoft.Security/assessments'
          name: '45cfe080-ceb1-a91e-9743-71551ed24e94'
          existenceCondition: {
            field: 'Microsoft.Security/assessments/status.code'
            in: [
              'NotApplicable'
              'Healthy'
            ]
          }
        }
      }
    }
  }
}
