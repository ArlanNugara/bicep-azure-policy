targetScope = 'subscription'

param policyInputData object
param client string
output policyId string = es2_endpoint_protection_solution_should_be_installed_on_virtual_machine_scale_sets_policy.id

resource es2_endpoint_protection_solution_should_be_installed_on_virtual_machine_scale_sets_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-'
  properties: {
    displayName: '${client}-'
    policyType: 'Custom'
    mode: 'All'
    description: 'Audit the existence and health of an endpoint protection solution on your virtual machines scale sets, to protect them from threats and vulnerabilities.'
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
        field: 'type'
        equals: 'Microsoft.Compute/virtualMachineScaleSets'
      }
      then: {
        effect: 'AuditIfNotExists'
        details: {
          type: 'Microsoft.Security/assessments'
          name: 'e71020c2-860c-3235-cd39-04f3f8c936d2'
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
