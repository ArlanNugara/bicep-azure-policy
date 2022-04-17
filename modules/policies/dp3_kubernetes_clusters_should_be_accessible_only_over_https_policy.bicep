targetScope = 'subscription'

param policyInputData object
param client string
output policyId string = dp3_kubernetes_clusters_should_be_accessible_only_over_https_policy.id

resource dp3_kubernetes_clusters_should_be_accessible_only_over_https_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-'
  properties: {
    displayName: '${client}-'
    policyType: 'Custom'
    mode: 'All'
    description: 'Use of HTTPS ensures authentication and protects data in transit from network layer eavesdropping attacks. This capability is currently generally available for Kubernetes Service (AKS), and in preview for AKS Engine and Azure Arc enabled Kubernetes. For more info, visit https://aka.ms/kubepolicydoc'
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
        effect: 'Deny'
        details: {
          constraintTemplate: 'https://store.policy.core.windows.net/kubernetes/ingress-https-only/v1/template.yaml'
          constraint: 'https://store.policy.core.windows.net/kubernetes/ingress-https-only/v1/constraint.yaml'
          excludedNamespaces: '[parameters(\'excludedNamespaces\')]'
          namespaces: '[parameters(\'namespaces\')]'
          labelSelector: '[parameters(\'labelSelector\')]'
        }
      }
    }
  }
}
