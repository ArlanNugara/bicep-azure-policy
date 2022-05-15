targetScope = 'subscription'

param client string
output policyId string = dp3_windows_web_servers_should_be_configured_to_use_secure_communication_protocols_policy.id
resource dp3_windows_web_servers_should_be_configured_to_use_secure_communication_protocols_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-Windows web servers should be configured to use secure communication protocols'
  properties: {
    displayName: '${client}-Windows web servers should be configured to use secure communication protocols'
    policyType: 'Custom'
    mode: 'Indexed'
    description: 'To protect the privacy of information communicated over the Internet, your web servers should use the latest version of the industry-standard cryptographic protocol, Transport Layer Security (TLS). TLS secures communications over a network by using security certificates to encrypt a connection between machines.'
    metadata: {
      category: 'Guest Configuration'
      version: '4.0.0'
      requiredProviders: [
        'Microsoft.GuestConfiguration'
      ]
      guestConfiguration: {
        name: 'AuditSecureProtocol'
        version: '1.*'
        configurationParameter: {
          MinimumTLSVersion: '[SecureWebServer]s1;MinimumTLSVersion'
        }
      }
    }
    parameters: {
      IncludeArcMachines: {
        type: 'String'
        metadata: {
          displayName: 'Include Arc connected servers'
          description: 'By selecting this option, you agree to be charged monthly per Arc connected machine.'
          portalReview: 'true'
        }
        allowedValues: [
          'true'
          'false'
        ]
        defaultValue: 'false'
      }
      MinimumTLSVersion: {
        type: 'String'
        metadata: {
          displayName: 'Minimum TLS version'
          description: 'The minimum TLS protocol version that should be enabled. Windows web servers with lower TLS versions will be marked as non-compliant.'
        }
        allowedValues: [
          '1.1'
          '1.2'
        ]
        defaultValue: '1.1'
      }
    }
    policyRule: {
      if: {
        anyOf: [
          {
            allOf: [
              {
                field: 'type'
                equals: 'Microsoft.Compute/virtualMachines'
              }
              {
                anyOf: [
                  {
                    field: 'Microsoft.Compute/imagePublisher'
                    in: [
                      'esri'
                      'incredibuild'
                      'MicrosoftDynamicsAX'
                      'MicrosoftSharepoint'
                      'MicrosoftVisualStudio'
                      'MicrosoftWindowsServerHPCPack'
                    ]
                  }
                  {
                    allOf: [
                      {
                        field: 'Microsoft.Compute/imagePublisher'
                        equals: 'MicrosoftWindowsServer'
                      }
                      {
                        field: 'Microsoft.Compute/imageSKU'
                        notLike: '2008*'
                      }
                    ]
                  }
                  {
                    allOf: [
                      {
                        field: 'Microsoft.Compute/imagePublisher'
                        equals: 'MicrosoftSQLServer'
                      }
                      {
                        field: 'Microsoft.Compute/imageOffer'
                        notLike: 'SQL2008*'
                      }
                    ]
                  }
                  {
                    allOf: [
                      {
                        field: 'Microsoft.Compute/imagePublisher'
                        equals: 'microsoft-dsvm'
                      }
                      {
                        field: 'Microsoft.Compute/imageOffer'
                        like: 'dsvm-win*'
                      }
                    ]
                  }
                  {
                    allOf: [
                      {
                        field: 'Microsoft.Compute/imagePublisher'
                        equals: 'microsoft-ads'
                      }
                      {
                        field: 'Microsoft.Compute/imageOffer'
                        in: [
                          'standard-data-science-vm'
                          'windows-data-science-vm'
                        ]
                      }
                    ]
                  }
                  {
                    allOf: [
                      {
                        field: 'Microsoft.Compute/imagePublisher'
                        equals: 'batch'
                      }
                      {
                        field: 'Microsoft.Compute/imageOffer'
                        equals: 'rendering-windows2016'
                      }
                    ]
                  }
                  {
                    allOf: [
                      {
                        field: 'Microsoft.Compute/imagePublisher'
                        equals: 'center-for-internet-security-inc'
                      }
                      {
                        field: 'Microsoft.Compute/imageOffer'
                        like: 'cis-windows-server-201*'
                      }
                    ]
                  }
                  {
                    allOf: [
                      {
                        field: 'Microsoft.Compute/imagePublisher'
                        equals: 'pivotal'
                      }
                      {
                        field: 'Microsoft.Compute/imageOffer'
                        like: 'bosh-windows-server*'
                      }
                    ]
                  }
                  {
                    allOf: [
                      {
                        field: 'Microsoft.Compute/imagePublisher'
                        equals: 'cloud-infrastructure-services'
                      }
                      {
                        field: 'Microsoft.Compute/imageOffer'
                        like: 'ad*'
                      }
                    ]
                  }
                  {
                    allOf: [
                      {
                        anyOf: [
                          {
                            field: 'Microsoft.Compute/virtualMachines/osProfile.windowsConfiguration'
                            exists: 'true'
                          }
                          {
                            field: 'Microsoft.Compute/virtualMachines/storageProfile.osDisk.osType'
                            like: 'Windows*'
                          }
                        ]
                      }
                      {
                        anyOf: [
                          {
                            field: 'Microsoft.Compute/imageSKU'
                            exists: 'false'
                          }
                          {
                            allOf: [
                              {
                                field: 'Microsoft.Compute/imageSKU'
                                notLike: '2008*'
                              }
                              {
                                field: 'Microsoft.Compute/imageOffer'
                                notLike: 'SQL2008*'
                              }
                            ]
                          }
                        ]
                      }
                    ]
                  }
                ]
              }
            ]
          }
          {
            allOf: [
              {
                value: '[parameters(\'IncludeArcMachines\')]'
                equals: 'true'
              }
              {
                anyOf: [
                  {
                    allOf: [
                      {
                        field: 'type'
                        equals: 'Microsoft.HybridCompute/machines'
                      }
                      {
                        field: 'Microsoft.HybridCompute/imageOffer'
                        like: 'windows*'
                      }
                    ]
                  }
                  {
                    allOf: [
                      {
                        field: 'type'
                        equals: 'Microsoft.ConnectedVMwarevSphere/virtualMachines'
                      }
                      {
                        field: 'Microsoft.ConnectedVMwarevSphere/virtualMachines/osProfile.osType'
                        like: 'windows*'
                      }
                    ]
                  }
                ]
              }
            ]
          }
        ]
      }
      then: {
        effect: 'AuditIfNotExists'
        details: {
          type: 'Microsoft.GuestConfiguration/guestConfigurationAssignments'
          name: 'AuditSecureProtocol'
          existenceCondition: {
            allOf: [
              {
                field: 'Microsoft.GuestConfiguration/guestConfigurationAssignments/complianceStatus'
                equals: 'Compliant'
              }
              {
                field: 'Microsoft.GuestConfiguration/guestConfigurationAssignments/parameterHash'
                equals: '[base64(concat(\'[SecureWebServer]s1;MinimumTLSVersion\', \'=\', parameters(\'MinimumTLSVersion\')))]'
              }
            ]
          }
        }
      }
    }
  }
}
