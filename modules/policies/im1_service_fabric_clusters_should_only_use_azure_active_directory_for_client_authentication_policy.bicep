targetScope = 'subscription'

param policyInputData object
param client string
output policyId string = im1_service_fabric_clusters_should_only_use_azure_active_directory_for_client_authentication_policy.id

resource im1_service_fabric_clusters_should_only_use_azure_active_directory_for_client_authentication_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-'
  properties: {
    displayName: '${client}-'
    policyType: 'Custom'
    mode: 'All'
    description: 'Audit usage of client authentication only via Azure Active Directory in Service Fabric'
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
