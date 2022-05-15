targetScope = 'subscription'

param client string
output policyId string = dp3_api_app_should_only_be_accessible_over_https_policy.id
resource dp3_api_app_should_only_be_accessible_over_https_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-API App should only be accessible over HTTPS'
  properties: {
    displayName: '${client}-API App should only be accessible over HTTPS'
    policyType: 'Custom'
    mode: 'Indexed'
    description: 'Use of HTTPS ensures server/service authentication and protects data in transit from network layer eavesdropping attacks.'
    metadata: {
      version: '1.0.0'
      category: 'App Service'
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
