targetScope = 'subscription'

param client string
output policyId string = dp3_ftps_only_should_be_required_in_your_function_app_policy.id
resource dp3_ftps_only_should_be_required_in_your_function_app_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-FTPS only should be required in your Function App'
  properties: {
    displayName: '${client}-FTPS only should be required in your Function App'
    policyType: 'Custom'
    mode: 'Indexed'
    description: 'Enable FTPS enforcement for enhanced security'
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
            field: 'Microsoft.Web/sites/config/ftpsState'
            in: [
              'FtpsOnly'
              'Disabled'
            ]
          }
        }
      }
    }
  }
}
