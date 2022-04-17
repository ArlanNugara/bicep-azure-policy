targetScope = 'subscription'

param policyInputData object
param client string
output policyId string = ns2_vm_image_builder_templates_should_use_private_link_policy.id

resource ns2_vm_image_builder_templates_should_use_private_link_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-'
  properties: {
    displayName: '${client}-'
    policyType: 'Custom'
    mode: 'All'
    description: 'Azure Private Link lets you connect your virtual network to Azure services without a public IP address at the source or destination. The Private Link platform handles the connectivity between the consumer and services over the Azure backbone network. By mapping private endpoints to your VM Image Builder building resources, data leakage risks are reduced. Learn more about private links at: https://docs.microsoft.com/azure/virtual-machines/linux/image-builder-networking#deploy-using-an-existing-vnet.'
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
            equals: 'Microsoft.VirtualMachineImages/imageTemplates'
          }
          {
            field: 'Microsoft.VirtualMachineImages/imageTemplates/vmProfile.vnetConfig'
            exists: 'false'
          }
        ]
      }
      then: {
        effect: 'Audit'
      }
    }
  }
}
