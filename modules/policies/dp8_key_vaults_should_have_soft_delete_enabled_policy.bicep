targetScope = 'subscription'

param client string
output policyId string = dp8_key_vaults_should_have_soft_delete_enabled_policy.id
resource dp8_key_vaults_should_have_soft_delete_enabled_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-Key vaults should have soft delete enabled'
  properties: {
    displayName: '${client}-Key vaults should have soft delete enabled'
    policyType: 'Custom'
    mode: 'Indexed'
    description: 'Deleting a key vault without soft delete enabled permanently deletes all secrets, keys, and certificates stored in the key vault. Accidental deletion of a key vault can lead to permanent data loss. Soft delete allows you to recover an accidentally deleted key vault for a configurable retention period.'
    metadata: {
      version: '2.0.0'
      category: 'Key Vault'
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
                exists: 'false'
              }
              {
                field: 'Microsoft.KeyVault/vaults/enableSoftDelete'
                equals: 'false'
              }
            ]
          }
        ]
      }
      then: {
        effect: 'Audit'
      }
    }
  }
}
