targetScope = 'subscription'

param policyInputData object
param client string
output policyId string = allowed_vms_os_version_policy.id

resource allowed_vms_os_version_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-${policyInputData.name}'
  properties: {
    displayName: '${client}-${policyInputData.displayName}'
    policyType: 'Custom'
    mode: 'All'
    description: policyInputData.description
    metadata:{
      category: 'Compute'
    }
    parameters: {
      windowsOSVersionAllowedNames: {
        type: 'Array'
        metadata: {
          description: 'Allowed VM Windows OS Version'
          displayName: 'Allowed VM Windows OS Version'
        }
        defaultValue: policyInputData.windowsOSVersions
      }
      linuxOSVersionAllowedNames: {
        type: 'Array'
        metadata: {
          description: 'Allowed VM Linux OS Version'
          displayName: 'Allowed VM Linux OS Version'
        }
        defaultValue: policyInputData.linuxOSVersions
      }
    }
    policyRule: {
      if: {
        allOf: [
          {
            field: 'type'
            in: [
              'Microsoft.Compute/virtualMachines'
              'Microsoft.Compute/VirtualMachineScaleSets'
            ]
          }
          {
            allOf: [
              {
                not: {
                  allOf: [
                    {
                      field: 'Microsoft.Compute/licenseType'
                      notEquals: 'Windows_Server'
                    }
                    {
                      field: 'Microsoft.Compute/imagePublisher'
                      in: [
                        'MicrosoftWindowsServer'
                      ]
                    }
                    {
                      field: 'Microsoft.Compute/imageOffer'
                      in: [
                        'WindowsServer'
                      ]
                    }
                    {
                      field: 'Microsoft.Compute/imageSku'
                      in: '[parameters(\'windowsOSVersionAllowedNames\')]'
                    }
                  ]
                }
              }
              {
                not: {
                  allOf: [
                    {
                      field: 'Microsoft.Compute/imagePublisher'
                      in: [
                        'RedHat'
                        'Canonical'
                      ]
                    }
                    {
                      field: 'Microsoft.Compute/imageOffer'
                      in: [
                        'RHEL'
                        'UbuntuServer'
                      ]
                    }
                    {
                      field: 'Microsoft.Compute/imageSku'
                      in: '[parameters(\'linuxOSVersionAllowedNames\')]'
                    }
                  ]
                }
              }
            ]
          }
        ]
      }
      then: {
        effect: policyInputData.effect
      }
    }
  }
}
