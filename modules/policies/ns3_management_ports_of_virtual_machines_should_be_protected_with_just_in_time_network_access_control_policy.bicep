targetScope = 'subscription'

param client string
output policyId string = ns3_management_ports_of_virtual_machines_should_be_protected_with_just_in_time_network_access_control_policy.id
resource ns3_management_ports_of_virtual_machines_should_be_protected_with_just_in_time_network_access_control_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-Management ports of virtual machines should be protected with just-in-time network access control'
  properties: {
    displayName: '${client}-Management ports of virtual machines should be protected with just-in-time network access control'
    policyType: 'Custom'
    mode: 'All'
    description: 'Possible network Just In Time (JIT) access will be monitored by Azure Security Center as recommendations'
    metadata: {
      version: '3.0.0'
      category: 'Security Center'
    }
    policyRule: {
      if: {
        field: 'type'
        equals: 'Microsoft.Compute/virtualMachines'
      }
      then: {
        effect: 'AuditIfNotExists'
        details: {
          type: 'Microsoft.Security/assessments'
          name: '805651bc-6ecd-4c73-9b55-97a19d0582d0'
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
