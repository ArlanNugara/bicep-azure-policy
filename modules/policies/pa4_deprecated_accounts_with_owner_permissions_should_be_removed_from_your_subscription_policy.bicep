targetScope = 'subscription'

param client string
output policyId string = pa4_deprecated_accounts_with_owner_permissions_should_be_removed_from_your_subscription_policy.id
resource pa4_deprecated_accounts_with_owner_permissions_should_be_removed_from_your_subscription_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-Deprecated accounts with owner permissions should be removed from your subscription'
  properties: {
    displayName: '${client}-Deprecated accounts with owner permissions should be removed from your subscription'
    policyType: 'Custom'
    mode: 'All'
    description: 'Deprecated accounts with owner permissions should be removed from your subscription.  Deprecated accounts are accounts that have been blocked from signing in.'
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
          name: 'e52064aa-6853-e252-a11e-dffc675689c2'
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
