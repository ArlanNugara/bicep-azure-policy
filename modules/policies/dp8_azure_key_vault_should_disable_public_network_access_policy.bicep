targetScope = 'subscription'

param policyInputData object
param client string
output policyId string = dp8_azure_key_vault_should_disable_public_network_access_policy.id

resource dp8_azure_key_vault_should_disable_public_network_access_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-'
  properties: {
    displayName: '${client}-'
    policyType: 'Custom'
    mode: 'All'
    description: 'Disable public network access for your key vault so that its not accessible over the public internet. This can reduce data leakage risks. Learn more at: https://aka.ms/akvprivatelink.'
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
