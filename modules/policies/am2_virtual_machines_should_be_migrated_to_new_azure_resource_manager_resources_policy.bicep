targetScope = 'subscription'

param policyInputData object
param client string
output policyId string = am2_virtual_machines_should_be_migrated_to_new_azure_resource_manager_resources_policy.id

resource am2_virtual_machines_should_be_migrated_to_new_azure_resource_manager_resources_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-'
  properties: {
    displayName: '${client}-'
    policyType: 'Custom'
    mode: 'All'
    description: 'Use new Azure Resource Manager for your virtual machines to provide security enhancements such as: stronger access control (RBAC), better auditing, Azure Resource Manager based deployment and governance, access to managed identities, access to key vault for secrets, Azure AD-based authentication and support for tags and resource groups for easier security management'
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
              'Microsoft.ClassicCompute/virtualMachines'
              'Microsoft.Compute/virtualMachines'
            ]
          }
          {
            value: '[field(\'type\')]'
            equals: 'Microsoft.ClassicCompute/virtualMachines'
          }
        ]
      }
      then: {
        effect: 'Audit'
      }
    }
  }
}
