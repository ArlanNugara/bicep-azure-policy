targetScope = 'subscription'

param client string
output policyId string = pa4_external_accounts_with_read_permissions_should_be_removed_from_your_subscription_policy.id
resource pa4_external_accounts_with_read_permissions_should_be_removed_from_your_subscription_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-External accounts with read permissions should be removed from your subscription'
  properties: {
    displayName: '${client}-External accounts with read permissions should be removed from your subscription'
    policyType: 'Custom'
    mode: 'All'
    description: 'External accounts with read privileges should be removed from your subscription in order to prevent unmonitored access.'
    metadata: {
      version: '3.0.0'
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
          type: 'Microsoft.Security/assessments'
          name: 'a8c6a4ad-d51e-88fe-2979-d3ee3c864f8b'
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
