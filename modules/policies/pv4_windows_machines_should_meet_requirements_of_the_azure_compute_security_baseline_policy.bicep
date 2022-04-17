targetScope = 'subscription'

param policyInputData object
param client string
output policyId string = pv4_windows_machines_should_meet_requirements_of_the_azure_compute_security_baseline_policy.id

resource pv4_windows_machines_should_meet_requirements_of_the_azure_compute_security_baseline_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
   name: '${client}-'
   properties: {
      displayName: '${client}-'
      policyType: 'Custom'
      mode: 'All'
      description: 'Requires that prerequisites are deployed to the policy assignment scope. For details, visit https://aka.ms/gcpol. Machines are non-compliant if the machine is not configured correctly for one of the recommendations in the Azure compute security baseline.'
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
                                 'MicrosoftWindowsDesktop'
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
               name: 'AzureWindowsBaseline'
               existenceCondition: {
                  field: 'Microsoft.GuestConfiguration/guestConfigurationAssignments/complianceStatus'
                  equals: 'Compliant'
               }
            }
         }
      }
   }
}
