targetScope = 'subscription'

param client string
output policyId string = ns3_ip_forwarding_on_your_virtual_machine_should_be_disabled_policy.id
resource ns3_ip_forwarding_on_your_virtual_machine_should_be_disabled_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-IP Forwarding on your virtual machine should be disabled'
  properties: {
    displayName: '${client}-IP Forwarding on your virtual machine should be disabled'
    policyType: 'Custom'
    mode: 'All'
    description: 'Enabling IP forwarding on a virtual machine\'s NIC allows the machine to receive traffic addressed to other destinations. IP forwarding is rarely required (e.g., when using the VM as a network virtual appliance), and therefore, this should be reviewed by the network security team.'
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
          name: 'c3b51c94-588b-426b-a892-24696f9e54cc'
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
