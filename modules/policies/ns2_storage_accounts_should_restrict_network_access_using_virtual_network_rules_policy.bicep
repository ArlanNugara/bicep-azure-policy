targetScope = 'subscription'

param client string
output policyId string = ns2_storage_accounts_should_restrict_network_access_using_virtual_network_rules_policy.id
resource ns2_storage_accounts_should_restrict_network_access_using_virtual_network_rules_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-Storage accounts should restrict network access using virtual network rules'
  properties: {
    displayName: '${client}-Storage accounts should restrict network access using virtual network rules'
    policyType: 'Custom'
    mode: 'Indexed'
    description: 'Protect your storage accounts from potential threats using virtual network rules as a preferred method instead of IP-based filtering. Disabling IP-based filtering prevents public IPs from accessing your storage accounts.'
    metadata: {
      version: '1.0.1'
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
            anyOf: [
              {
                field: 'Microsoft.Storage/storageAccounts/networkAcls.defaultAction'
                notEquals: 'Deny'
              }
              {
                count: {
                  field: 'Microsoft.Storage/storageAccounts/networkAcls.ipRules[*]'
                }
                greaterOrEquals: 1
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
