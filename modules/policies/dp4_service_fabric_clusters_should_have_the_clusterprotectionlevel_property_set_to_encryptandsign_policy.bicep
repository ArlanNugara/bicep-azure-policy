targetScope = 'subscription'

param client string
output policyId string = dp4_service_fabric_clusters_should_have_the_clusterprotectionlevel_property_set_to_encryptandsign_policy.id
resource dp4_service_fabric_clusters_should_have_the_clusterprotectionlevel_property_set_to_encryptandsign_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-Service Fabric clusters should have the ClusterProtectionLevel property set to EncryptAndSign'
  properties: {
    displayName: '${client}-Service Fabric clusters should have the ClusterProtectionLevel property set to EncryptAndSign'
    policyType: 'Custom'
    mode: 'Indexed'
    description: 'Service Fabric provides three levels of protection (None, Sign and EncryptAndSign) for node-to-node communication using a primary cluster certificate. Set the protection level to ensure that all node-to-node messages are encrypted and digitally signed'
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
                field: 'Microsoft.ServiceFabric/clusters/fabricSettings[*].name'
                notEquals: 'Security'
              }
              {
                field: 'Microsoft.ServiceFabric/clusters/fabricSettings[*].parameters[*].name'
                notEquals: 'ClusterProtectionLevel'
              }
              {
                field: 'Microsoft.ServiceFabric/clusters/fabricSettings[*].parameters[*].value'
                notEquals: 'EncryptAndSign'
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
