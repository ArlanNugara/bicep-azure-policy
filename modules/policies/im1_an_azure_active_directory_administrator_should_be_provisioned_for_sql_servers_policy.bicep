targetScope = 'subscription'

param client string
output policyId string = im1_an_azure_active_directory_administrator_should_be_provisioned_for_sql_servers_policy.id
resource im1_an_azure_active_directory_administrator_should_be_provisioned_for_sql_servers_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-An Azure Active Directory administrator should be provisioned for SQL servers'
  properties: {
    displayName: '${client}-An Azure Active Directory administrator should be provisioned for SQL servers'
    policyType: 'Custom'
    mode: 'Indexed'
    description: 'Audit provisioning of an Azure Active Directory administrator for your SQL server to enable Azure AD authentication. Azure AD authentication enables simplified permission management and centralized identity management of database users and other Microsoft services'
    metadata: {
      version: '1.0.0'
      category: 'SQL'
    }
    policyRule: {
      if: {
        field: 'type'
        equals: 'Microsoft.Sql/servers'
      }
      then: {
        effect: 'AuditIfNotExists'
        details: {
          type: 'Microsoft.Sql/servers/administrators'
        }
      }
    }
  }
}
