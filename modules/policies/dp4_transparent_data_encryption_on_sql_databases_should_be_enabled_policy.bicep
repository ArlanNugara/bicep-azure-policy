targetScope = 'subscription'

param policyInputData object
param client string
output policyId string = dp4_transparent_data_encryption_on_sql_databases_should_be_enabled_policy.id

resource dp4_transparent_data_encryption_on_sql_databases_should_be_enabled_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-'
  properties: {
    displayName: '${client}-'
    policyType: 'Custom'
    mode: 'All'
    description: 'Transparent data encryption should be enabled to protect data-at-rest and meet compliance requirements'
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
            equals: 'Microsoft.Sql/servers/databases'
          }
          {
            field: 'name'
            notEquals: 'master'
          }
        ]
      }
      then: {
        effect: 'AuditIfNotExists'
        details: {
          type: 'Microsoft.Sql/servers/databases/transparentDataEncryption'
          name: 'current'
          existenceCondition: {
            anyOf: [
              {
                field: 'Microsoft.Sql/transparentDataEncryption.status'
                equals: 'enabled'
              }
              {
                field: 'Microsoft.Sql/servers/databases/transparentDataEncryption/state'
                equals: 'enabled'
              }
            ]
          }
        }
      }
    }
  }
}
