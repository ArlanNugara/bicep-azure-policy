targetScope = 'subscription'

param client string
output policyId string = es3_endpoint_protection_health_issues_should_be_resolved_on_your_machines_policy.id
resource es3_endpoint_protection_health_issues_should_be_resolved_on_your_machines_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-Endpoint protection health issues should be resolved on your machines'
  properties: {
    displayName: '${client}-Endpoint protection health issues should be resolved on your machines'
    policyType: 'Custom'
    mode: 'All'
    description: 'Resolve endpoint protection health issues on your virtual machines to protect them from latest threats and vulnerabilities. Azure Security Center supported endpoint protection solutions are documented here - https://docs.microsoft.com/azure/security-center/security-center-services?tabs=features-windows#supported-endpoint-protection-solutions. Endpoint protection assessment is documented here - https://docs.microsoft.com/azure/security-center/security-center-endpoint-protection.'
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
          name: '37a3689a-818e-4a0e-82ac-b1392b9bb000'
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
