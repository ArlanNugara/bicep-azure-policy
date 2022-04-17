targetScope = 'subscription'

param policyInputData object
param client string
output policyId string = dp8_key_vaults_should_have_soft_delete_enabled_policy.id

resource dp8_key_vaults_should_have_soft_delete_enabled_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-'
  properties: {
    displayName: '${client}-'
    policyType: 'Custom'
    mode: 'All'
    description: 'Deleting a key vault without soft delete enabled permanently deletes all secrets, keys, and certificates stored in the key vault. Accidental deletion of a key vault can lead to permanent data loss. Soft delete allows you to recover an accidentally deleted key vault for a configurable retention period.'
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
