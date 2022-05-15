targetScope = 'subscription'

param client string
output policyId string = dp5_storage_accounts_should_use_customer_managed_key_for_encryption_policy.id
resource dp5_storage_accounts_should_use_customer_managed_key_for_encryption_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-Storage accounts should use customer-managed key for encryption'
  properties: {
    displayName: '${client}-Storage accounts should use customer-managed key for encryption'
    policyType: 'Custom'
    mode: 'Indexed'
    description: 'Secure your blob and file storage account with greater flexibility using customer-managed keys. When you specify a customer-managed key, that key is used to protect and control access to the key that encrypts your data. Using customer-managed keys provides additional capabilities to control rotation of the key encryption key or cryptographically erase data.'
    metadata: {
      version: '1.0.3'
      category: 'Storage'
    }
    policyRule: {
      if: {
        allOf: [
          {
            field: 'type'
            equals: 'Microsoft.Storage/storageAccounts'
          }
          {
            not: {
              field: 'Microsoft.Storage/storageAccounts/encryption.keySource'
              equals: 'Microsoft.Keyvault'
            }
          }
        ]
      }
      then: {
        effect: 'Audit'
      }
    }
  }
}
