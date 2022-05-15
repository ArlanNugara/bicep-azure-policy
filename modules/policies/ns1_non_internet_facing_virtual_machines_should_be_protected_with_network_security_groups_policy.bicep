targetScope = 'subscription'

param client string
output policyId string = ns1_non_internet_facing_virtual_machines_should_be_protected_with_network_security_groups_policy.id
resource ns1_non_internet_facing_virtual_machines_should_be_protected_with_network_security_groups_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-Non-internet-facing virtual machines should be protected with network security groups'
  properties: {
    displayName: '${client}-Non-internet-facing virtual machines should be protected with network security groups'
    policyType: 'Custom'
    mode: 'All'
    description: 'Protect your non-internet-facing virtual machines from potential threats by restricting access with network security groups (NSG). Learn more about controlling traffic with NSGs at https://aka.ms/nsg-doc'
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
          name: 'a9341235-9389-42f0-a0bf-9bfb57960d44'
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
