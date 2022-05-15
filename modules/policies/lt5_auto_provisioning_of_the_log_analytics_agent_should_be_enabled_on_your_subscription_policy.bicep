targetScope = 'subscription'

param client string
output policyId string = lt5_auto_provisioning_of_the_log_analytics_agent_should_be_enabled_on_your_subscription_policy.id
resource lt5_auto_provisioning_of_the_log_analytics_agent_should_be_enabled_on_your_subscription_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-Auto provisioning of the Log Analytics agent should be enabled on your subscription'
  properties: {
    displayName: '${client}-Auto provisioning of the Log Analytics agent should be enabled on your subscription'
    policyType: 'Custom'
    mode: 'All'
    description: 'To monitor for security vulnerabilities and threats, Azure Security Center collects data from your Azure virtual machines. Data is collected by the Log Analytics agent, formerly known as the Microsoft Monitoring Agent (MMA), which reads various security-related configurations and event logs from the machine and copies the data to your Log Analytics workspace for analysis. We recommend enabling auto provisioning to automatically deploy the agent to all supported Azure VMs and any new ones that are created.'
    metadata: {
      version: '1.0.1'
      category: 'Security Center'
    }
    policyRule: {
      if: {
        field: 'type'
        equals: 'Microsoft.Resources/subscriptions'
      }
      then: {
        effect: 'AuditIfNotExists'
        details: {
          type: 'Microsoft.Security/autoProvisioningSettings'
          existenceCondition: {
            field: 'Microsoft.Security/autoProvisioningSettings/autoProvision'
            equals: 'On'
          }
        }
      }
    }
  }
}
