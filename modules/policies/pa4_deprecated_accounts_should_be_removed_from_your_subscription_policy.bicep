targetScope = 'subscription'

param client string
output policyId string = pa4_deprecated_accounts_should_be_removed_from_your_subscription_policy.id
resource pa4_deprecated_accounts_should_be_removed_from_your_subscription_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-Deprecated accounts should be removed from your subscription'
  properties: {
    displayName: '${client}-Deprecated accounts should be removed from your subscription'
    policyType: 'Custom'
    mode: 'All'
    description: 'Deprecated accounts should be removed from your subscriptions.  Deprecated accounts are accounts that have been blocked from signing in.'
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
          name: '00c6d40b-e990-6acf-d4f3-471e747a27c4'
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
