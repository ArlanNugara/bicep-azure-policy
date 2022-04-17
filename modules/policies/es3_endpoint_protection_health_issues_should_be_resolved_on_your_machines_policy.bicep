targetScope = 'subscription'

param policyInputData object
param client string
output policyId string = es3_endpoint_protection_health_issues_should_be_resolved_on_your_machines_policy.id

resource es3_endpoint_protection_health_issues_should_be_resolved_on_your_machines_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-'
  properties: {
    displayName: '${client}-'
    policyType: 'Custom'
    mode: 'All'
    description: 'Resolve endpoint protection health issues on your virtual machines to protect them from latest threats and vulnerabilities. Azure Security Center supported endpoint protection solutions are documented here - https://docs.microsoft.com/azure/security-center/security-center-services?tabs=features-windows#supported-endpoint-protection-solutions. Endpoint protection assessment is documented here - https://docs.microsoft.com/azure/security-center/security-center-endpoint-protection.'
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
