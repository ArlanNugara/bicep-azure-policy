targetScope = 'subscription'

param client string
output policyId string = ir2_email_notification_for_high_severity_alerts_should_be_enabled_policy.id
resource ir2_email_notification_for_high_severity_alerts_should_be_enabled_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-Email notification for high severity alerts should be enabled'
  properties: {
    displayName: '${client}-Email notification for high severity alerts should be enabled'
    policyType: 'Custom'
    mode: 'All'
    description: 'To ensure the relevant people in your organization are notified when there is a potential security breach in one of your subscriptions, enable email notifications for high severity alerts in Security Center.'
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
          type: 'Microsoft.Security/securityContacts'
          existenceCondition: {
            field: 'Microsoft.Security/securityContacts/alertNotifications'
            notEquals: 'Off'
          }
        }
      }
    }
  }
}
