targetScope = 'subscription'

param client string
output policyId string = dp6_key_vault_secrets_should_have_an_expiration_date_policy.id
resource dp6_key_vault_secrets_should_have_an_expiration_date_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-Key Vault secrets should have an expiration date'
  properties: {
    displayName: '${client}-Key Vault secrets should have an expiration date'
    policyType: 'Custom'
    mode: 'Microsoft.KeyVault.Data'
    description: 'Secrets should have a defined expiration date and not be permanent. Secrets that are valid forever provide a potential attacker with more time to compromise them. It is a recommended security practice to set expiration dates on secrets.'
    metadata: {
      version: '1.0.2'
      category: 'Key Vault'
    }
    policyRule: {
      if: {
        allOf: [
          {
            field: 'type'
            equals: 'Microsoft.KeyVault.Data/vaults/secrets'
          }
          {
            field: 'Microsoft.KeyVault.Data/vaults/secrets/attributes.expiresOn'
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
