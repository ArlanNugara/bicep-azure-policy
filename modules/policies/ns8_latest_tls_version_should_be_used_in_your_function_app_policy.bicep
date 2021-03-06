targetScope = 'subscription'

param client string
output policyId string = ns8_latest_tls_version_should_be_used_in_your_function_app_policy.id
resource ns8_latest_tls_version_should_be_used_in_your_function_app_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-Latest TLS version should be used in your Function App'
  properties: {
    displayName: '${client}-Latest TLS version should be used in your Function App'
    policyType: 'Custom'
    mode: 'Indexed'
    description: 'Upgrade to the latest TLS version'
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
            like: 'functionapp*'
          }
        ]
      }
      then: {
        effect: 'AuditIfNotExists'
        details: {
          type: 'Microsoft.Web/sites/config'
          name: 'web'
          existenceCondition: {
            field: 'Microsoft.Web/sites/config/minTlsVersion'
            equals: '1.2'
          }
        }
      }
    }
  }
}
