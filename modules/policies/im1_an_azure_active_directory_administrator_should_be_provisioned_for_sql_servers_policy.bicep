targetScope = 'subscription'

param policyInputData object
param client string
output policyId string = im1_an_azure_active_directory_administrator_should_be_provisioned_for_sql_servers_policy.id

resource im1_an_azure_active_directory_administrator_should_be_provisioned_for_sql_servers_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-'
  properties: {
    displayName: '${client}-'
    policyType: 'Custom'
    mode: 'All'
    description: 'Audit provisioning of an Azure Active Directory administrator for your SQL server to enable Azure AD authentication. Azure AD authentication enables simplified permission management and centralized identity management of database users and other Microsoft services'
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
