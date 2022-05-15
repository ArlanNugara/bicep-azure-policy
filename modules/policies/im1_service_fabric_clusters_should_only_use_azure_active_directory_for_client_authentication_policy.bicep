targetScope = 'subscription'

param client string
output policyId string = im1_service_fabric_clusters_should_only_use_azure_active_directory_for_client_authentication_policy.id
resource im1_service_fabric_clusters_should_only_use_azure_active_directory_for_client_authentication_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-Service Fabric clusters should only use Azure Active Directory for client authentication'
  properties: {
    displayName: '${client}-Service Fabric clusters should only use Azure Active Directory for client authentication'
    policyType: 'Custom'
    mode: 'Indexed'
    description: 'Audit usage of client authentication only via Azure Active Directory in Service Fabric'
    metadata: {
      version: '1.1.0'
      category: 'Service Fabric'
    }
    policyRule: {
      if: {
        allOf: [
          {
            field: 'type'
            equals: 'Microsoft.ServiceFabric/clusters'
          }
          {
            anyOf: [
              {
                field: 'Microsoft.ServiceFabric/clusters/azureActiveDirectory.tenantId'
                exists: 'false'
              }
              {
                field: 'Microsoft.ServiceFabric/clusters/azureActiveDirectory.tenantId'
                equals: ''
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
