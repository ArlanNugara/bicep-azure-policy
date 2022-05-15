targetScope = 'subscription'

param client string
output policyId string = lt5_log_analytics_agent_should_be_installed_on_your_virtual_machine_for_azure_security_center_monitoring_policy.id
resource lt5_log_analytics_agent_should_be_installed_on_your_virtual_machine_for_azure_security_center_monitoring_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-Log Analytics agent should be installed on your virtual machine for Azure Security Center monitoring'
  properties: {
    displayName: '${client}-Log Analytics agent should be installed on your virtual machine for Azure Security Center monitoring'
    policyType: 'Custom'
    mode: 'All'
    description: 'This policy audits any Windows/Linux virtual machines (VMs) if the Log Analytics agent is not installed which Security Center uses to monitor for security vulnerabilities and threats'
    metadata: {
      version: '1.0.0'
      category: 'Security Center'
    }
    policyRule: {
      if: {
        field: 'type'
        in: [
          'Microsoft.ClassicCompute/virtualMachines'
          'Microsoft.Compute/virtualMachines'
        ]
      }
      then: {
        effect: 'AuditIfNotExists'
        details: {
          type: 'Microsoft.Security/assessments'
          name: 'd1db3318-01ff-16de-29eb-28b344515626'
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
