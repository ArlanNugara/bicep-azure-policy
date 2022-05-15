targetScope = 'subscription'

param client string
output policyId string = im3_virtual_machines_guest_configuration_extension_should_be_deployed_with_system_assigned_managed_identity_policy.id
resource im3_virtual_machines_guest_configuration_extension_should_be_deployed_with_system_assigned_managed_identity_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-Virtual machines Guest Configuration extension should be deployed with system-assigned managed identity'
  properties: {
    displayName: '${client}-Virtual machines Guest Configuration extension should be deployed with system-assigned managed identity'
    policyType: 'Custom'
    mode: 'Indexed'
    description: 'The Guest Configuration extension requires a system assigned managed identity. Azure virtual machines in the scope of this policy will be non-compliant when they have the Guest Configuration extension installed but do not have a system assigned managed identity. Learn more at https://aka.ms/gcpol'
    metadata: {
      version: '1.0.1'
      category: 'Security Center'
    }
    policyRule: {
      if: {
        allOf: [
          {
            field: 'type'
            equals: 'Microsoft.Compute/virtualMachines/extensions'
          }
          {
            field: 'Microsoft.Compute/virtualMachines/extensions/publisher'
            equals: 'Microsoft.GuestConfiguration'
          }
        ]
      }
      then: {
        effect: 'AuditIfNotExists'
        details: {
          type: 'Microsoft.Compute/virtualMachines'
          name: '[first(split(field(\'fullName\'), \'/\'))]'
          existenceCondition: {
            field: 'identity.type'
            contains: 'SystemAssigned'
          }
        }
      }
    }
  }
}
