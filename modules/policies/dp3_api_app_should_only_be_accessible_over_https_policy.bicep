targetScope = 'subscription'

param policyInputData object
param client string
output policyId string = dp3_api_app_should_only_be_accessible_over_https_policy.id

resource dp3_api_app_should_only_be_accessible_over_https_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-'
  properties: {
    displayName: '${client}-'
    policyType: 'Custom'
    mode: 'All'
    description: 'Use of HTTPS ensures server/service authentication and protects data in transit from network layer eavesdropping attacks.'
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
            like: '*api'
          }
          {
            field: 'Microsoft.Web/sites/httpsOnly'
            equals: 'false'
          }
        ]
      }
      then: {
        effect: 'Audit'
      }
    }
  }
}
