targetScope = 'subscription'

param client string
output policyId string = pa7_role_based_access_control_rbac_should_be_used_on_kubernetes_services_policy.id
resource pa7_role_based_access_control_rbac_should_be_used_on_kubernetes_services_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-Role-Based Access Control (RBAC) should be used on Kubernetes Services'
  properties: {
    displayName: '${client}-Role-Based Access Control (RBAC) should be used on Kubernetes Services'
    policyType: 'Custom'
    mode: 'All'
    description: 'To provide granular filtering on the actions that users can perform, use Role-Based Access Control (RBAC) to manage permissions in Kubernetes Service Clusters and configure relevant authorization policies.'
    metadata: {
      version: '1.0.2'
      category: 'Security Center'
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
