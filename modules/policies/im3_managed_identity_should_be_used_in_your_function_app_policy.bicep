targetScope = 'subscription'

param client string
output policyId string = im3_managed_identity_should_be_used_in_your_function_app_policy.id
resource im3_managed_identity_should_be_used_in_your_function_app_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-Managed identity should be used in your Function App'
  properties: {
    displayName: '${client}-Managed identity should be used in your Function App'
    policyType: 'Custom'
    mode: 'Indexed'
    description: 'Use a managed identity for enhanced authentication security'
    metadata: {
      version: '2.0.0'
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
