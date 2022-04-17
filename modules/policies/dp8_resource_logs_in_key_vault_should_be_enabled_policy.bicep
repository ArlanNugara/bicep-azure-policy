targetScope = 'subscription'

param policyInputData object
param client string
output policyId string = dp8_resource_logs_in_key_vault_should_be_enabled_policy.id

resource dp8_resource_logs_in_key_vault_should_be_enabled_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
   name: '${client}-'
   properties: {
      displayName: '${client}-'
      policyType: 'Custom'
      mode: 'All'
      description: 'Audit enabling of resource logs. This enables you to recreate activity trails to use for investigation purposes when a security incident occurs or when your network is compromised'
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
            field: 'type'
            equals: 'Microsoft.KeyVault/vaults'
         }
         then: {
            effect: 'AuditIfNotExists'
            details: {
               type: 'Microsoft.Insights/diagnosticSettings'
               existenceCondition: {
                  count: {
                     field: 'Microsoft.Insights/diagnosticSettings/logs[*]'
                     where: {
                        anyOf: [
                           {
                              allOf: [
                                 {
                                    field: 'Microsoft.Insights/diagnosticSettings/logs[*].retentionPolicy.enabled'
                                    equals: 'true'
                                 }
                                 {
                                    anyOf: [
                                       {
                                          field: 'Microsoft.Insights/diagnosticSettings/logs[*].retentionPolicy.days'
                                          equals: '0'
                                       }
                                       {
                                          value: '[padLeft(current(\'Microsoft.Insights/diagnosticSettings/logs[*].retentionPolicy.days\')   3   \'0\')]'
                                          greaterOrEquals: '[padLeft(parameters(\'requiredRetentionDays\')   3   \'0\')]'
                                       }
                                    ]
                                 }
                                 {
                                    field: 'Microsoft.Insights/diagnosticSettings/logs.enabled'
                                    equals: 'true'
                                 }
                              ]
                           }
                           {
                              allOf: [
                                 {
                                    field: 'Microsoft.Insights/diagnosticSettings/logs.enabled'
                                    equals: 'true'
                                 }
                                 {
                                    anyOf: [
                                       {
                                          field: 'Microsoft.Insights/diagnosticSettings/logs[*].retentionPolicy.enabled'
                                          notEquals: 'true'
                                       }
                                       {
                                          field: 'Microsoft.Insights/diagnosticSettings/storageAccountId'
                                          exists: false
                                       }
                                    ]
                                 }
                              ]
                           }
                        ]
                     }
                  }
                  greaterOrEquals: 1
               }
            }
         }
      }
   }
}
