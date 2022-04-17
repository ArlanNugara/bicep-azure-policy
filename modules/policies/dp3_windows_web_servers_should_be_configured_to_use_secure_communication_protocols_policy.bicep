targetScope = 'subscription'

param policyInputData object
param client string
output policyId string = dp3_windows_web_servers_should_be_configured_to_use_secure_communication_protocols_policy.id

resource dp3_windows_web_servers_should_be_configured_to_use_secure_communication_protocols_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
   name: '${client}-'
   properties: {
      displayName: '${client}-'
      policyType: 'Custom'
      mode: 'All'
      description: 'To protect the privacy of information communicated over the Internet, your web servers should use the latest version of the industry-standard cryptographic protocol, Transport Layer Security (TLS). TLS secures communications over a network by using security certificates to encrypt a connection between machines.'
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
                        equals: '[base64(concat(\'[SecureWebServer]s1;MinimumTLSVersion\'   \'=\'   parameters(\'MinimumTLSVersion\')))]'
                     }
                  ]
               }
            }
         }
      }
   }
}
