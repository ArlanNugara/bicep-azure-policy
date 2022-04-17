targetScope = 'subscription'

param policyInputData object
param client string
output policyId string = dp4_service_fabric_clusters_should_have_the_clusterprotectionlevel_property_set_to_encryptandsign_policy.id

resource dp4_service_fabric_clusters_should_have_the_clusterprotectionlevel_property_set_to_encryptandsign_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-'
  properties: {
    displayName: '${client}-'
    policyType: 'Custom'
    mode: 'All'
    description: 'Service Fabric provides three levels of protection (None, Sign and EncryptAndSign) for node-to-node communication using a primary cluster certificate. Set the protection level to ensure that all node-to-node messages are encrypted and digitally signed'
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
