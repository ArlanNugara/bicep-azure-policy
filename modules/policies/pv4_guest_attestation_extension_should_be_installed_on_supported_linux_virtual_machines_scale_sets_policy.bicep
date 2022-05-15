targetScope = 'subscription'

param client string
output policyId string = pv4_guest_attestation_extension_should_be_installed_on_supported_linux_virtual_machines_scale_sets_policy.id
resource pv4_guest_attestation_extension_should_be_installed_on_supported_linux_virtual_machines_scale_sets_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-Guest Attestation extension should be installed on supported Linux virtual machines scale sets'
  properties: {
    displayName: '${client}-Guest Attestation extension should be installed on supported Linux virtual machines scale sets'
    policyType: 'Custom'
    mode: 'Indexed'
    description: 'Install Guest Attestation extension on supported Linux virtual machines scale sets to allow Azure Security Center to proactively attest and monitor the boot integrity. Once installed, boot integrity will be attested via Remote Attestation. This assessment only applies to trusted launch enabled Linux virtual machine scale sets.'
    metadata: {
      category: 'Security Center'
      version: '4.0.0-preview'
      preview: true
    }
    policyRule: {
      if: {
        allOf: [
          {
            field: 'type'
            equals: 'Microsoft.Compute/virtualMachineScaleSets'
          }
          {
            anyOf: [
              {
                allOf: [
                  {
                    field: 'Microsoft.Compute/imagePublisher'
                    equals: 'Canonical'
                  }
                  {
                    field: 'Microsoft.Compute/imageOffer'
                    equals: 'UbuntuServer'
                  }
                  {
                    field: 'Microsoft.Compute/imageSku'
                    like: '18_04-lts-gen2'
                  }
                ]
              }
              {
                allOf: [
                  {
                    field: 'Microsoft.Compute/imagePublisher'
                    equals: 'Canonical'
                  }
                  {
                    field: 'Microsoft.Compute/imageOffer'
                    equals: '0001-com-ubuntu-server-focal'
                  }
                  {
                    field: 'Microsoft.Compute/imageSku'
                    like: '20_04-lts-gen2'
                  }
                ]
              }
              {
                allOf: [
                  {
                    field: 'Microsoft.Compute/imagePublisher'
                    equals: 'RedHat'
                  }
                  {
                    field: 'Microsoft.Compute/imageOffer'
                    equals: 'RHEL'
                  }
                  {
                    field: 'Microsoft.Compute/imageSku'
                    like: '83-gen2'
                  }
                ]
              }
              {
                allOf: [
                  {
                    field: 'Microsoft.Compute/imagePublisher'
                    equals: 'SUSE'
                  }
                  {
                    field: 'Microsoft.Compute/imageOffer'
                    equals: 'SLES-15-SP2'
                  }
                  {
                    field: 'Microsoft.Compute/imageSku'
                    like: 'gen2'
                  }
                ]
              }
              {
                allOf: [
                  {
                    field: 'Microsoft.Compute/imagePublisher'
                    equals: 'OpenLogic'
                  }
                  {
                    field: 'Microsoft.Compute/imageOffer'
                    equals: 'CENTOS'
                  }
                  {
                    field: 'Microsoft.Compute/imageSku'
                    equals: '8_3-gen2'
                  }
                ]
              }
              {
                allOf: [
                  {
                    field: 'Microsoft.Compute/imagePublisher'
                    equals: 'Oracle'
                  }
                  {
                    field: 'Microsoft.Compute/imageOffer'
                    equals: 'Oracle-Linux'
                  }
                  {
                    field: 'Microsoft.Compute/imageSku'
                    equals: 'ol83-lvm-gen2'
                  }
                ]
              }
              {
                allOf: [
                  {
                    field: 'Microsoft.Compute/imagePublisher'
                    equals: 'microsoftcblmariner'
                  }
                  {
                    field: 'Microsoft.Compute/imageOffer'
                    equals: 'cbl-mariner'
                  }
                  {
                    field: 'Microsoft.Compute/imageSku'
                    equals: '1-gen2'
                  }
                ]
              }
              {
                allOf: [
                  {
                    field: 'Microsoft.Compute/imagePublisher'
                    equals: 'debian'
                  }
                  {
                    field: 'Microsoft.Compute/imageOffer'
                    equals: 'debian-11'
                  }
                  {
                    field: 'Microsoft.Compute/imageSku'
                    equals: '11-gen2'
                  }
                ]
              }
            ]
          }
          {
            field: 'Microsoft.Compute/virtualMachineScaleSets/virtualMachineProfile.securityProfile.securityType'
            equals: 'TrustedLaunch'
          }
          {
            field: 'Microsoft.Compute/virtualMachineScaleSets/virtualMachineProfile.securityProfile.uefiSettings'
            exists: 'true'
          }
          {
            field: 'Microsoft.Compute/virtualMachineScaleSets/virtualMachineProfile.securityProfile.uefiSettings.vTpmEnabled'
            equals: 'true'
          }
          {
            field: 'Microsoft.Compute/virtualMachineScaleSets/virtualMachineProfile.securityProfile.uefiSettings.secureBootEnabled'
            equals: 'true'
          }
        ]
      }
      then: {
        effect: 'AuditIfNotExists'
        details: {
          type: 'Microsoft.Compute/virtualMachineScaleSets/extensions'
          existenceCondition: {
            allOf: [
              {
                field: 'Microsoft.Compute/virtualMachineScaleSets/extensions/publisher'
                equals: 'Microsoft.Azure.Security.LinuxAttestation'
              }
              {
                field: 'Microsoft.Compute/virtualMachineScaleSets/extensions/type'
                equals: 'GuestAttestation'
              }
              {
                field: 'Microsoft.Compute/virtualMachineScaleSets/extensions/provisioningState'
                in: [
                  'Succeeded'
                  'Provisioning succeeded'
                ]
              }
            ]
          }
        }
      }
    }
  }
}
