targetScope = 'subscription'

param client string
output policyId string = dp8_azure_key_vault_should_disable_public_network_access_policy.id
resource dp8_azure_key_vault_should_disable_public_network_access_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-Azure Key Vault should disable public network access'
  properties: {
    displayName: '${client}-Azure Key Vault should disable public network access'
    policyType: 'Custom'
    mode: 'Indexed'
    description: 'Disable public network access for your key vault so that it\'s not accessible over the public internet. This can reduce data leakage risks. Learn more at: https://aka.ms/akvprivatelink.'
    metadata: {
      version: '2.0.0-preview'
      category: 'Key Vault'
      preview: true
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
            field: 'Microsoft.KeyVault/vaults/networkAcls.defaultAction'
            notEquals: 'Deny'
          }
        ]
      }
      then: {
        effect: 'Audit'
      }
    }
  }
}
