targetScope = 'subscription'

param client string
output policyId string = pa1_a_maximum_of_3_owners_should_be_designated_for_your_subscription_policy.id
resource pa1_a_maximum_of_3_owners_should_be_designated_for_your_subscription_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-A maximum of 3 owners should be designated for your subscription'
  properties: {
    displayName: '${client}-A maximum of 3 owners should be designated for your subscription'
    policyType: 'Custom'
    mode: 'All'
    description: 'It is recommended to designate up to 3 subscription owners in order to reduce the potential for breach by a compromised owner.'
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
          name: '6f90a6d6-d4d6-0794-0ec1-98fa77878c2e'
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
