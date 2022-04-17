targetScope = 'subscription'

param policyInputData object
param client string
output policyId string = ns3_ip_forwarding_on_your_virtual_machine_should_be_disabled_policy.id

resource ns3_ip_forwarding_on_your_virtual_machine_should_be_disabled_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-'
  properties: {
    displayName: '${client}-'
    policyType: 'Custom'
    mode: 'All'
    description: 'Enabling IP forwarding on a virtual machines NIC allows the machine to receive traffic addressed to other destinations. IP forwarding is rarely required (e.g., when using the VM as a network virtual appliance), and therefore, this should be reviewed by the network security team.'
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
