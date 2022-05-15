targetScope = 'subscription'

param client string
output policyId string = pa4_external_accounts_with_write_permissions_should_be_removed_from_your_subscription_policy.id
resource pa4_external_accounts_with_write_permissions_should_be_removed_from_your_subscription_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-External accounts with write permissions should be removed from your subscription'
  properties: {
    displayName: '${client}-External accounts with write permissions should be removed from your subscription'
    policyType: 'Custom'
    mode: 'All'
    description: 'External accounts with write privileges should be removed from your subscription in order to prevent unmonitored access.'
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
          name: '04e7147b-0deb-9796-2e5c-0336343ceb3d'
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
