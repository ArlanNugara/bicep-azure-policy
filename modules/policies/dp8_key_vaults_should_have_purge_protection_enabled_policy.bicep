targetScope = 'subscription'

param policyInputData object
param client string
output policyId string = dp8_key_vaults_should_have_purge_protection_enabled_policy.id

resource dp8_key_vaults_should_have_purge_protection_enabled_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-'
  properties: {
    displayName: '${client}-'
    policyType: 'Custom'
    mode: 'All'
    description: 'Malicious deletion of a key vault can lead to permanent data loss. A malicious insider in your organization can potentially delete and purge key vaults. Purge protection protects you from insider attacks by enforcing a mandatory retention period for soft deleted key vaults. No one inside your organization or Microsoft will be able to purge your key vaults during the soft delete retention period.'
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
