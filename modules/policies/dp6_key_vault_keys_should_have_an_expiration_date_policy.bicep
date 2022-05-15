targetScope = 'subscription'

param client string
output policyId string = dp6_key_vault_keys_should_have_an_expiration_date_policy.id
resource dp6_key_vault_keys_should_have_an_expiration_date_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-Key Vault keys should have an expiration date'
  properties: {
    displayName: '${client}-Key Vault keys should have an expiration date'
    policyType: 'Custom'
    mode: 'Microsoft.KeyVault.Data'
    description: 'Cryptographic keys should have a defined expiration date and not be permanent. Keys that are valid forever provide a potential attacker with more time to compromise the key. It is a recommended security practice to set expiration dates on cryptographic keys.'
    metadata: {
      version: '1.0.2'
      category: 'Key Vault'
    }
    policyRule: {
      if: {
        allOf: [
          {
            field: 'type'
            equals: 'Microsoft.KeyVault.Data/vaults/keys'
          }
          {
            field: 'Microsoft.KeyVault.Data/vaults/keys/attributes.expiresOn'
            exists: false
          }
        ]
      }
      then: {
        effect: 'Audit'
      }
    }
  }
}
