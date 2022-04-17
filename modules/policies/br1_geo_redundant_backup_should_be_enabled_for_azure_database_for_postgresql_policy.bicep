targetScope = 'subscription'

param policyInputData object
param client string
output policyId string = br1_geo_redundant_backup_should_be_enabled_for_azure_database_for_postgresql_policy.id

resource br1_geo_redundant_backup_should_be_enabled_for_azure_database_for_postgresql_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-'
  properties: {
    displayName: '${client}-'
    policyType: 'Custom'
    mode: 'All'
    description: 'Azure Database for PostgreSQL allows you to choose the redundancy option for your database server. It can be set to a geo-redundant backup storage in which the data is not only stored within the region in which your server is hosted, but is also replicated to a paired region to provide recovery option in case of a region failure. Configuring geo-redundant storage for backup is only allowed during server create.'
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
            equals: 'Microsoft.DBforPostgreSQL/servers'
          }
          {
            field: 'Microsoft.DBforPostgreSQL/servers/storageProfile.geoRedundantBackup'
            notEquals: 'Enabled'
          }
        ]
      }
      then: {
        effect: 'Audit'
      }
    }
  }
}
