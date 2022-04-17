targetScope = 'subscription'

param policyInputData object
param client string
output policyId string = dp5_mysql_servers_should_use_customer_managed_keys_to_encrypt_data_at_rest_policy.id

resource dp5_mysql_servers_should_use_customer_managed_keys_to_encrypt_data_at_rest_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-'
  properties: {
    displayName: '${client}-'
    policyType: 'Custom'
    mode: 'All'
    description: 'Use customer-managed keys to manage the encryption at rest of your MySQL servers. By default, the data is encrypted at rest with service-managed keys, but customer-managed keys are commonly required to meet regulatory compliance standards. Customer-managed keys enable the data to be encrypted with an Azure Key Vault key created and owned by you. You have full control and responsibility for the key lifecycle, including rotation and management.'
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
