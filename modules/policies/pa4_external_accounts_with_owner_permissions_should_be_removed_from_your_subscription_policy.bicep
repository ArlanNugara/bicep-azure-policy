targetScope = 'subscription'

param client string
output policyId string = pa4_external_accounts_with_owner_permissions_should_be_removed_from_your_subscription_policy.id
resource pa4_external_accounts_with_owner_permissions_should_be_removed_from_your_subscription_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-External accounts with owner permissions should be removed from your subscription'
  properties: {
    displayName: '${client}-External accounts with owner permissions should be removed from your subscription'
    policyType: 'Custom'
    mode: 'All'
    description: 'External accounts with owner permissions should be removed from your subscription in order to prevent unmonitored access.'
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
          name: 'c3b6ae71-f1f0-31b4-e6c1-d5951285d03d'
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
