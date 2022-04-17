targetScope = 'subscription'

param policyInputData object
param client string
output policyId string = pa7_role_based_access_control_rbac_should_be_used_on_kubernetes_services_policy.id

resource pa7_role_based_access_control_rbac_should_be_used_on_kubernetes_services_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-'
  properties: {
    displayName: '${client}-'
    policyType: 'Custom'
    mode: 'All'
    description: 'To provide granular filtering on the actions that users can perform, use Role-Based Access Control (RBAC) to manage permissions in Kubernetes Service Clusters and configure relevant authorization policies.'
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
            equals: 'Microsoft.ContainerService/managedClusters'
          }
          {
            anyOf: [
              {
                field: 'Microsoft.ContainerService/managedClusters/enableRBAC'
                exists: 'false'
              }
              {
                field: 'Microsoft.ContainerService/managedClusters/enableRBAC'
                equals: 'false'
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
