targetScope = 'subscription'

param client string
output policyId string = ns1_all_network_ports_should_be_restricted_on_network_security_groups_associated_to_your_virtual_machine_policy.id
resource ns1_all_network_ports_should_be_restricted_on_network_security_groups_associated_to_your_virtual_machine_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-All network ports should be restricted on network security groups associated to your virtual machine'
  properties: {
    displayName: '${client}-All network ports should be restricted on network security groups associated to your virtual machine'
    policyType: 'Custom'
    mode: 'All'
    description: 'Azure Security Center has identified some of your network security groups\' inbound rules to be too permissive. Inbound rules should not allow access from \'Any\' or \'Internet\' ranges. This can potentially enable attackers to target your resources.'
    metadata: {
      version: '3.0.0'
      category: 'Security Center'
    }
    policyRule: {
      if: {
        field: 'type'
        in: [
          'Microsoft.Compute/virtualMachines'
          'Microsoft.ClassicCompute/virtualMachines'
        ]
      }
      then: {
        effect: 'AuditIfNotExists'
        details: {
          type: 'Microsoft.Security/assessments'
          name: '3b20e985-f71f-483b-b078-f30d73936d43'
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
