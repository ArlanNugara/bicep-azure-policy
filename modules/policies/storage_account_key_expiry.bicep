targetScope = 'subscription'

param policyInputData object
param client string
output policyId string = storage_account_key_expiry_policy.id

resource storage_account_key_expiry_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-${policyInputData.name}'
  properties: {
    displayName: '${client}-${policyInputData.displayName}'
    policyType: 'Custom'
    mode: 'All'
    description: policyInputData.description
    metadata: {
      category: 'Storage'
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
            equals: 'Microsoft.Storage/storageAccounts'
          }
          {
            anyOf: [
              {
                value: '[utcNow()]'
                greater: '[if(and(not(empty(coalesce(field(\'Microsoft.Storage/storageAccounts/keyCreationTime.key1\'), \'\'))), not(empty(string(coalesce(field(\'Microsoft.Storage/storageAccounts/keyPolicy.keyExpirationPeriodInDays\'), \'\'))))), addDays(field(\'Microsoft.Storage/storageAccounts/keyCreationTime.key1\'), field(\'Microsoft.Storage/storageAccounts/keyPolicy.keyExpirationPeriodInDays\')), utcNow())]'
              }
              {
                value: '[utcNow()]'
                greater: '[if(and(not(empty(coalesce(field(\'Microsoft.Storage/storageAccounts/keyCreationTime.key2\'), \'\'))), not(empty(string(coalesce(field(\'Microsoft.Storage/storageAccounts/keyPolicy.keyExpirationPeriodInDays\'), \'\'))))), addDays(field(\'Microsoft.Storage/storageAccounts/keyCreationTime.key2\'), field(\'Microsoft.Storage/storageAccounts/keyPolicy.keyExpirationPeriodInDays\')), utcNow())]'
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
