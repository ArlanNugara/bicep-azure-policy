targetScope = 'subscription'

param policyInputData object
param client string
output policyId string = pv2_cors_should_not_allow_every_resource_to_access_your_api_app_policy.id

resource pv2_cors_should_not_allow_every_resource_to_access_your_api_app_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-'
  properties: {
    displayName: '${client}-'
    policyType: 'Custom'
    mode: 'All'
    description: 'Cross-Origin Resource Sharing (CORS) should not allow all domains to access your API app. Allow only required domains to interact with your API app.'
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
        ]
      }
      then: {
        effect: 'AuditIfNotExists'
        details: {
          type: 'Microsoft.Web/sites/config'
          existenceCondition: {
            field: 'Microsoft.Web/sites/config/web.cors.allowedOrigins[*]'
            notEquals: '*'
          }
        }
      }
    }
  }
}
