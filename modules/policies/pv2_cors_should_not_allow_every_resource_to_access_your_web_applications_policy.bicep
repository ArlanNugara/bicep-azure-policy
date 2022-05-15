targetScope = 'subscription'

param client string
output policyId string = pv2_cors_should_not_allow_every_resource_to_access_your_web_applications_policy.id
resource pv2_cors_should_not_allow_every_resource_to_access_your_web_applications_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-CORS should not allow every resource to access your Web Applications'
  properties: {
    displayName: '${client}-CORS should not allow every resource to access your Web Applications'
    policyType: 'Custom'
    mode: 'Indexed'
    description: 'Cross-Origin Resource Sharing (CORS) should not allow all domains to access your web application. Allow only required domains to interact with your web app.'
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
            like: 'app*'
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
