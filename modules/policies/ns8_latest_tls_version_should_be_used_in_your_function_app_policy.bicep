targetScope = 'subscription'

param policyInputData object
param client string
output policyId string = ns8_latest_tls_version_should_be_used_in_your_function_app_policy.id

resource ns8_latest_tls_version_should_be_used_in_your_function_app_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-'
  properties: {
    displayName: '${client}-'
    policyType: 'Custom'
    mode: 'All'
    description: 'Upgrade to the latest TLS version'
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
