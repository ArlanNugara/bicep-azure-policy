targetScope = 'subscription'

param client string
output policyId string = ir2_subscriptions_should_have_a_contact_email_address_for_security_issues_policy.id
resource ir2_subscriptions_should_have_a_contact_email_address_for_security_issues_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-Subscriptions should have a contact email address for security issues'
  properties: {
    displayName: '${client}-Subscriptions should have a contact email address for security issues'
    policyType: 'Custom'
    mode: 'All'
    description: 'To ensure the relevant people in your organization are notified when there is a potential security breach in one of your subscriptions, set a security contact to receive email notifications from Security Center.'
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
            field: 'Microsoft.Security/securityContacts/email'
            notEquals: ''
          }
        }
      }
    }
  }
}
