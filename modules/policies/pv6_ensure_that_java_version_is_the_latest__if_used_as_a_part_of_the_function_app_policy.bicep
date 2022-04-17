targetScope = 'subscription'

param policyInputData object
param client string
output policyId string = pv6_ensure_that_java_version_is_the_latest__if_used_as_a_part_of_the_function_app_policy.id

resource pv6_ensure_that_java_version_is_the_latest__if_used_as_a_part_of_the_function_app_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-'
  properties: {
    displayName: '${client}-'
    policyType: 'Custom'
    mode: 'All'
    description: 'Periodically, newer versions are released for Java software either due to security flaws or to include additional functionality. Using the latest Java version for Function apps is recommended in order to take advantage of security fixes, if any, and/or new functionalities of the latest version. Currently, this policy only applies to Linux web apps.'
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
          {
            field: 'kind'
            contains: 'linux'
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
                field: 'Microsoft.Web/sites/config/web.linuxFxVersion'
                notContains: 'JAVA'
              }
              {
                field: 'Microsoft.Web/sites/config/web.linuxFxVersion'
                like: '[concat(\'*\'   parameters(\'JavaLatestVersion\'))]'
              }
            ]
          }
        }
      }
    }
  }
}
