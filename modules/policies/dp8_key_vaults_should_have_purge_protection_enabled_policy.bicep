targetScope = 'subscription'

param client string
output policyId string = dp8_key_vaults_should_have_purge_protection_enabled_policy.id
resource dp8_key_vaults_should_have_purge_protection_enabled_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-Key vaults should have purge protection enabled'
  properties: {
    displayName: '${client}-Key vaults should have purge protection enabled'
    policyType: 'Custom'
    mode: 'Indexed'
    description: 'Malicious deletion of a key vault can lead to permanent data loss. A malicious insider in your organization can potentially delete and purge key vaults. Purge protection protects you from insider attacks by enforcing a mandatory retention period for soft deleted key vaults. No one inside your organization or Microsoft will be able to purge your key vaults during the soft delete retention period.'
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
                field: 'Microsoft.KeyVault/vaults/enablePurgeProtection'
                exists: 'false'
              }
              {
                field: 'Microsoft.KeyVault/vaults/enableSoftDelete'
                equals: 'false'
              }
              {
                field: 'Microsoft.KeyVault/vaults/enablePurgeProtection'
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
