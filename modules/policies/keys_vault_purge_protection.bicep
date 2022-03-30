targetScope = 'subscription'

param policyInputData object
param client string
output policyId string = keys_vault_purge_protection_policy.id

resource keys_vault_purge_protection_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-${policyInputData.name}'
  properties: {
    displayName: '${client}-${policyInputData.displayName}'
    policyType: 'Custom'
    mode: 'All'
    description: policyInputData.description
    metadata: {
      category: 'Keys'
    }
    parameters: {
      policyEffect: {
        type: 'String'
        metadata: {
          description: 'Policy Effect'
          displayName: 'The effect determines what happens when the policy rule is evaluated to match'
        }
        defaultValue: policyInputData.effect
      }
    }
    policyRule: {
      if: {
        allOf: [
          {
            field: 'type'
            equals: 'Microsoft.KeyVault/vaults'
          }
          {
            not: {
              field: 'Microsoft.KeyVault/vaults/createMode'
              equals: 'recover'
            }
          }
          {
            anyOf: [
              {
                field: 'Microsoft.KeyVault/vaults/enableSoftDelete'
                exists: false
              }
              {
                field: 'Microsoft.KeyVault/vaults/enablePurgeProtection'
                exists: false
              }
              {
                field: 'Microsoft.KeyVault/vaults/enableSoftDelete'
                equals: false
              }
              {
                field: 'Microsoft.KeyVault/vaults/enablePurgeProtection'
                equals: false
              }
            ]
          }
        ]
      }
      then: {
        effect: '[parameters(\'policyEffect\')]'
      }
    }
  }
}
