targetScope = 'subscription'

param client string
output policyId string = dp5_mysql_servers_should_use_customer_managed_keys_to_encrypt_data_at_rest_policy.id
resource dp5_mysql_servers_should_use_customer_managed_keys_to_encrypt_data_at_rest_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-MySQL servers should use customer-managed keys to encrypt data at rest'
  properties: {
    displayName: '${client}-MySQL servers should use customer-managed keys to encrypt data at rest'
    policyType: 'Custom'
    mode: 'Indexed'
    description: 'Use customer-managed keys to manage the encryption at rest of your MySQL servers. By default, the data is encrypted at rest with service-managed keys, but customer-managed keys are commonly required to meet regulatory compliance standards. Customer-managed keys enable the data to be encrypted with an Azure Key Vault key created and owned by you. You have full control and responsibility for the key lifecycle, including rotation and management.'
    metadata: {
      version: '1.0.4'
      category: 'SQL'
    }
    policyRule: {
      if: {
        field: 'type'
        equals: 'Microsoft.DBforMySQL/servers'
      }
      then: {
        effect: 'AuditIfNotExists'
        details: {
          type: 'Microsoft.DBforMySQL/servers/keys'
          existenceCondition: {
            allOf: [
              {
                field: 'Microsoft.DBforMySQL/servers/keys/serverKeyType'
                equals: 'AzureKeyVault'
              }
              {
                field: 'Microsoft.DBforMySQL/servers/keys/uri'
                notEquals: ''
              }
              {
                field: 'Microsoft.DBforMySQL/servers/keys/uri'
                exists: 'true'
              }
            ]
          }
        }
      }
    }
  }
}
