targetScope = 'subscription'

param policyInputData object
param client string
output policyId string = pv2_kubernetes_clusters_should_not_use_the_default_namespace_policy.id

resource pv2_kubernetes_clusters_should_not_use_the_default_namespace_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-'
  properties: {
    displayName: '${client}-'
    policyType: 'Custom'
    mode: 'All'
    description: 'Prevent usage of the default namespace in Kubernetes clusters to protect against unauthorized access for ConfigMap, Pod, Secret, Service, and ServiceAccount resource types. For more information, see https://aka.ms/kubepolicydoc.'
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
        in: [
          'AKS Engine'
          'Microsoft.Kubernetes/connectedClusters'
          'Microsoft.ContainerService/managedClusters'
        ]
      }
      then: {
        effect: 'Audit'
        details: {
          constraintTemplate: 'https://store.policy.core.windows.net/kubernetes/block-default-namespace/v1/template.yaml'
          constraint: 'https://store.policy.core.windows.net/kubernetes/block-default-namespace/v1/constraint.yaml'
          excludedNamespaces: '[parameters(\'excludedNamespaces\')]'
          namespaces: '[parameters(\'namespaces\')]'
          labelSelector: '[parameters(\'labelSelector\')'
        }
      }
    }
  }
}
