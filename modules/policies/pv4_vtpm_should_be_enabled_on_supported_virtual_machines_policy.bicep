targetScope = 'subscription'

param policyInputData object
param client string
output policyId string = pv4_vtpm_should_be_enabled_on_supported_virtual_machines_policy.id

resource pv4_vtpm_should_be_enabled_on_supported_virtual_machines_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-'
  properties: {
    displayName: '${client}-'
    policyType: 'Custom'
    mode: 'All'
    description: 'Enable virtual TPM device on supported virtual machines to facilitate Measured Boot and other OS security features that require a TPM. Once enabled, vTPM can be used to attest boot integrity. This assessment only applies to trusted launch enabled virtual machines.'
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
            equals: 'Microsoft.Compute/virtualMachines'
          }
          {
            field: 'Microsoft.Compute/virtualMachines/securityProfile.securityType'
            equals: 'TrustedLaunch'
          }
          {
            field: 'Microsoft.Compute/virtualMachines/securityProfile.uefiSettings'
            exists: 'true'
          }
          {
            field: 'Microsoft.Compute/virtualMachines/securityProfile.uefiSettings.vTpmEnabled'
            notequals: 'true'
          }
        ]
      }
      then: {
        effect: 'Audit'
      }
    }
  }
}
