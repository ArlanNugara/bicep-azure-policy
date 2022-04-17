targetScope = 'subscription'

param policyInputData object
param client string
output policyId string = pa4_external_accounts_with_owner_permissions_should_be_removed_from_your_subscription_policy.id

resource pa4_external_accounts_with_owner_permissions_should_be_removed_from_your_subscription_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-'
  properties: {
    displayName: '${client}-'
    policyType: 'Custom'
    mode: 'All'
    description: 'External accounts with owner permissions should be removed from your subscription in order to prevent unmonitored access.'
    metadata: {
      category: 'Networking'
    }
    parameters: {
      nsgInboundRuleAllowedNames: {
        type: 'String'
        metadata: {
          description: 'Audit NSG Inbound Rules'
          displayName: 'Enable or disable the execution of the policy'
        }
        defaultValue: policyInputData.effect
      }
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
