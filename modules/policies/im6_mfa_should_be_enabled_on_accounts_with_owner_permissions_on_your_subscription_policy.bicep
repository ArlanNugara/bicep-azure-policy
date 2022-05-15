targetScope = 'subscription'

param client string
output policyId string = im6_mfa_should_be_enabled_on_accounts_with_owner_permissions_on_your_subscription_policy.id
resource im6_mfa_should_be_enabled_on_accounts_with_owner_permissions_on_your_subscription_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-MFA should be enabled on accounts with owner permissions on your subscription'
  properties: {
    displayName: '${client}-MFA should be enabled on accounts with owner permissions on your subscription'
    policyType: 'Custom'
    mode: 'All'
    description: 'Multi-Factor Authentication (MFA) should be enabled for all subscription accounts with owner permissions to prevent a breach of accounts or resources.'
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
          name: '94290b00-4d0c-d7b4-7cea-064a9554e681'
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
