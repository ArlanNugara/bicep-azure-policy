targetScope = 'subscription'

param client string
output policyId string = pv6_ensure_that_python_version_is_the_latest__if_used_as_a_part_of_the_api_app_policy.id
resource pv6_ensure_that_python_version_is_the_latest__if_used_as_a_part_of_the_api_app_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-Ensure that \'Python version\' is the latest, if used as a part of the API app'
  properties: {
    displayName: '${client}-Ensure that \'Python version\' is the latest, if used as a part of the API app'
    policyType: 'Custom'
    mode: 'Indexed'
    description: 'Periodically, newer versions are released for Python software either due to security flaws or to include additional functionality. Using the latest Python version for API apps is recommended in order to take advantage of security fixes, if any, and/or new functionalities of the latest version. Currently, this policy only applies to Linux web apps.'
    metadata: {
      version: '3.0.0'
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
                notContains: 'PYTHON'
              }
              {
                field: 'Microsoft.Web/sites/config/web.linuxFxVersion'
                equals: '[concat(\'PYTHON|\', parameters(\'LinuxPythonLatestVersion\'))]'
              }
            ]
          }
        }
      }
    }
  }
}
