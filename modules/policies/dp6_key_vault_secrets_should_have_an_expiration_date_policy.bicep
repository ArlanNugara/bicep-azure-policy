targetScope = 'subscription'

param policyInputData object
param client string
output policyId string = dp6_key_vault_secrets_should_have_an_expiration_date_policy.id

resource dp6_key_vault_secrets_should_have_an_expiration_date_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-'
  properties: {
    displayName: '${client}-'
    policyType: 'Custom'
    mode: 'All'
    description: 'Secrets should have a defined expiration date and not be permanent. Secrets that are valid forever provide a potential attacker with more time to compromise them. It is a recommended security practice to set expiration dates on secrets.'
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
