targetScope = 'subscription'

param client string
output policyId string = ns2_storage_accounts_should_use_private_link_policy.id
resource ns2_storage_accounts_should_use_private_link_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-Storage accounts should use private link'
  properties: {
    displayName: '${client}-Storage accounts should use private link'
    policyType: 'Custom'
    mode: 'Indexed'
    description: 'Azure Private Link lets you connect your virtual network to Azure services without a public IP address at the source or destination. The Private Link platform handles the connectivity between the consumer and services over the Azure backbone network. By mapping private endpoints to your storage account, data leakage risks are reduced. Learn more about private links at - https://aka.ms/azureprivatelinkoverview'
    metadata: {
      version: '2.0.0'
      category: 'Storage'
    }
    policyRule: {
      if: {
        field: 'type'
        equals: 'Microsoft.Storage/storageAccounts'
      }
      then: {
        effect: 'AuditIfNotExists'
        details: {
          type: 'Microsoft.Storage/storageAccounts/privateEndpointConnections'
          existenceCondition: {
            field: 'Microsoft.Storage/storageAccounts/privateEndpointConnections/privateLinkServiceConnectionState.status'
            equals: 'Approved'
          }
        }
      }
    }
  }
}
