targetScope = 'subscription'

param policyInputData object
param client string
output policyId string = dp5_azure_cosmos_db_accounts_should_use_customer_managed_keys_to_encrypt_data_at_rest_policy.id

resource dp5_azure_cosmos_db_accounts_should_use_customer_managed_keys_to_encrypt_data_at_rest_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-'
  properties: {
    displayName: '${client}-'
    policyType: 'Custom'
    mode: 'All'
    description: 'Use customer-managed keys to manage the encryption at rest of your Azure Cosmos DB. By default, the data is encrypted at rest with service-managed keys, but customer-managed keys are commonly required to meet regulatory compliance standards. Customer-managed keys enable the data to be encrypted with an Azure Key Vault key created and owned by you. You have full control and responsibility for the key lifecycle, including rotation and management. Learn more at https://aka.ms/cosmosdb-cmk.'
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
            field: 'Microsoft.DocumentDB/databaseAccounts/keyVaultKeyUri'
            exists: false
          }
          {
            field: 'type'
            equals: 'Microsoft.DocumentDB/databaseAccounts'
          }
        ]
      }
      then: {
        effect: 'Audit'
      }
    }
  }
}
