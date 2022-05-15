targetScope = 'subscription'

param client string
output policyId string = ns3_management_ports_should_be_closed_on_your_virtual_machines_policy.id
resource ns3_management_ports_should_be_closed_on_your_virtual_machines_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-Management ports should be closed on your virtual machines'
  properties: {
    displayName: '${client}-Management ports should be closed on your virtual machines'
    policyType: 'Custom'
    mode: 'All'
    description: 'Open remote management ports are exposing your VM to a high level of risk from Internet-based attacks. These attacks attempt to brute force credentials to gain admin access to the machine.'
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
          name: 'bc303248-3d14-44c2-96a0-55f5c326b5fe'
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
