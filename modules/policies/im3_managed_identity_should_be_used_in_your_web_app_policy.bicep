targetScope = 'subscription'

param policyInputData object
param client string
output policyId string = im3_managed_identity_should_be_used_in_your_web_app_policy.id

resource im3_managed_identity_should_be_used_in_your_web_app_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-'
  properties: {
    displayName: '${client}-'
    policyType: 'Custom'
    mode: 'All'
    description: 'Use a managed identity for enhanced authentication security'
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
        allOf: [
          {
            field: 'type'
            equals: 'Microsoft.Web/sites'
          }
          {
            field: 'kind'
            like: 'app*'
          }
        ]
      }
      then: {
        effect: 'AuditIfNotExists'
        details: {
          type: 'Microsoft.Web/sites/config'
          name: 'web'
          existenceCondition: {
            anyOf: [
              {
                field: 'Microsoft.Web/sites/config/managedServiceIdentityId'
                exists: 'true'
              }
              {
                field: 'Microsoft.Web/sites/config/xmanagedServiceIdentityId'
                exists: 'true'
              }
            ]
          }
        }
      }
    }
  }
}
