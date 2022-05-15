targetScope = 'subscription'

param client string
output policyId string = pv4_vtpm_should_be_enabled_on_supported_virtual_machines_policy.id
resource pv4_vtpm_should_be_enabled_on_supported_virtual_machines_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-vTPM should be enabled on supported virtual machines'
  properties: {
    displayName: '${client}-vTPM should be enabled on supported virtual machines'
    policyType: 'Custom'
    mode: 'Indexed'
    description: 'Enable virtual TPM device on supported virtual machines to facilitate Measured Boot and other OS security features that require a TPM. Once enabled, vTPM can be used to attest boot integrity. This assessment only applies to trusted launch enabled virtual machines.'
    metadata: {
      category: 'Security Center'
      version: '2.0.0-preview'
      preview: true
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
