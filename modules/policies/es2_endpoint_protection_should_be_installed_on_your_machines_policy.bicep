targetScope = 'subscription'

param client string
output policyId string = es2_endpoint_protection_should_be_installed_on_your_machines_policy.id
resource es2_endpoint_protection_should_be_installed_on_your_machines_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-Endpoint protection should be installed on your machines'
  properties: {
    displayName: '${client}-Endpoint protection should be installed on your machines'
    policyType: 'Custom'
    mode: 'All'
    description: 'To protect your machines from threats and vulnerabilities, install a supported endpoint protection solution.'
    metadata: {
      version: '1.0.0'
      category: 'Security Center'
    }
    policyRule: {
      if: {
        allOf: [
          {
            field: 'type'
            in: [
              'Microsoft.Compute/virtualMachines'
              'Microsoft.ClassicCompute/virtualMachines'
              'Microsoft.HybridCompute/machines'
            ]
          }
        ]
      }
      then: {
        effect: 'AuditIfNotExists'
        details: {
          type: 'Microsoft.Security/assessments'
          name: '4fb67663-9ab9-475d-b026-8c544cced439'
          existenceCondition: {
            field: 'Microsoft.Security/assessments/status.code'
            in: [
              'NotApplicable'
              'Healthy'
            ]
          }
        }
      }
    }
  }
}
