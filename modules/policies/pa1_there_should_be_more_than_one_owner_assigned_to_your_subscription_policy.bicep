targetScope = 'subscription'

param client string
output policyId string = pa1_there_should_be_more_than_one_owner_assigned_to_your_subscription_policy.id
resource pa1_there_should_be_more_than_one_owner_assigned_to_your_subscription_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-There should be more than one owner assigned to your subscription'
  properties: {
    displayName: '${client}-There should be more than one owner assigned to your subscription'
    policyType: 'Custom'
    mode: 'All'
    description: 'It is recommended to designate more than one subscription owner in order to have administrator access redundancy.'
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
          name: '2c79b4af-f830-b61e-92b9-63dfa30f16e4'
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
