targetScope = 'subscription'

param client string
output policyId string = br2_geo_redundant_backup_should_be_enabled_for_azure_database_for_mariadb_policy.id
resource br2_geo_redundant_backup_should_be_enabled_for_azure_database_for_mariadb_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-Geo-redundant backup should be enabled for Azure Database for MariaDB'
  properties: {
    displayName: '${client}-Geo-redundant backup should be enabled for Azure Database for MariaDB'
    policyType: 'Custom'
    mode: 'Indexed'
    description: 'Azure Database for MariaDB allows you to choose the redundancy option for your database server. It can be set to a geo-redundant backup storage in which the data is not only stored within the region in which your server is hosted, but is also replicated to a paired region to provide recovery option in case of a region failure. Configuring geo-redundant storage for backup is only allowed during server create.'
    metadata: {
      version: '1.0.1'
      category: 'SQL'
    }
    policyRule: {
      if: {
        allOf: [
          {
            field: 'type'
            equals: 'Microsoft.DBforMariaDB/servers'
          }
          {
            field: 'Microsoft.DBforMariaDB/servers/storageProfile.geoRedundantBackup'
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
