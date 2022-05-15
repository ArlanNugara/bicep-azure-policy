targetScope = 'subscription'

param client string
output policyId string = pv2_kubernetes_cluster_pods_should_only_use_approved_host_network_and_port_range_policy.id
resource pv2_kubernetes_cluster_pods_should_only_use_approved_host_network_and_port_range_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-Kubernetes cluster pods should only use approved host network and port range'
  properties: {
    displayName: '${client}-Kubernetes cluster pods should only use approved host network and port range'
    policyType: 'Custom'
    mode: 'Microsoft.Kubernetes.Data'
    description: 'Restrict pod access to the host network and the allowable host port range in a Kubernetes cluster. This recommendation is part of CIS 5.2.4 which is intended to improve the security of your Kubernetes environments. This policy is generally available for Kubernetes Service (AKS), and preview for AKS Engine and Azure Arc enabled Kubernetes. For more information, see https://aka.ms/kubepolicydoc.'
    metadata: {
      version: '4.1.0'
      category: 'Kubernetes'
    }
    parameters: {
      excludedNamespaces: {
        type: 'Array'
        metadata: {
          displayName: 'Namespace exclusions'
          description: 'List of Kubernetes namespaces to exclude from policy evaluation. System namespaces "kube-system", "gatekeeper-system" and "azure-arc" are always excluded by design.'
        }
        defaultValue: [
          'kube-system'
          'gatekeeper-system'
          'azure-arc'
        ]
      }
      namespaces: {
        type: 'Array'
        metadata: {
          displayName: 'Namespace inclusions'
          description: 'List of Kubernetes namespaces to only include in policy evaluation. An empty list means the policy is applied to all resources in all namespaces.'
        }
        defaultValue: []
      }
      labelSelector: {
        type: 'Object'
        metadata: {
          displayName: 'Kubernetes label selector'
          description: 'Label query to select Kubernetes resources for policy evaluation. An empty label selector matches all Kubernetes resources.'
        }
        defaultValue: {}
        schema: {
          description: 'A label selector is a label query over a set of resources. The result of matchLabels and matchExpressions are ANDed. An empty label selector matches all resources.'
          type: 'object'
          properties: {
            matchLabels: {
              description: 'matchLabels is a map of {key,value} pairs.'
              type: 'object'
              additionalProperties: {
                type: 'string'
              }
              minProperties: 1
            }
            matchExpressions: {
              description: 'matchExpressions is a list of values, a key, and an operator.'
              type: 'array'
              items: {
                type: 'object'
                properties: {
                  key: {
                    description: 'key is the label key that the selector applies to.'
                    type: 'string'
                  }
                  operator: {
                    description: 'operator represents a key\'s relationship to a set of values.'
                    type: 'string'
                    enum: [
                      'In'
                      'NotIn'
                      'Exists'
                      'DoesNotExist'
                    ]
                  }
                  values: {
                    description: 'values is an array of string values. If the operator is In or NotIn, the values array must be non-empty. If the operator is Exists or DoesNotExist, the values array must be empty.'
                    type: 'array'
                    items: {
                      type: 'string'
                    }
                  }
                }
                required: [
                  'key'
                  'operator'
                ]
                additionalProperties: false
              }
              minItems: 1
            }
          }
          additionalProperties: false
        }
      }
      allowHostNetwork: {
        type: 'Boolean'
        metadata: {
          displayName: 'Allow host network usage'
          description: 'Set this value to true if pod is allowed to use host network otherwise false.'
        }
        defaultValue: false
      }
      minPort: {
        type: 'Integer'
        metadata: {
          displayName: 'Min host port'
          description: 'The minimum value in the allowable host port range that pods can use in the host network namespace.'
        }
        defaultValue: 0
      }
      maxPort: {
        type: 'Integer'
        metadata: {
          displayName: 'Max host port'
          description: 'The maximum value in the allowable host port range that pods can use in the host network namespace.'
        }
        defaultValue: 0
      }
      excludedContainers: {
        type: 'Array'
        metadata: {
          displayName: 'Containers exclusions'
          description: 'The list of InitContainers and Containers to exclude from policy evaluation. The identify is the name of container. Use an empty list to apply this policy to all containers in all namespaces.'
        }
        defaultValue: []
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
          constraintTemplate: 'https://store.policy.core.windows.net/kubernetes/host-network-ports/v2/template.yaml'
          constraint: 'https://store.policy.core.windows.net/kubernetes/host-network-ports/v2/constraint.yaml'
          excludedNamespaces: '[parameters(\'excludedNamespaces\')]'
          namespaces: '[parameters(\'namespaces\')]'
          labelSelector: '[parameters(\'labelSelector\')]'
          values: {
            allowHostNetwork: '[parameters(\'allowHostNetwork\')]'
            minPort: '[parameters(\'minPort\')]'
            maxPort: '[parameters(\'maxPort\')]'
            excludedContainers: '[parameters(\'excludedContainers\')]'
          }
        }
      }
    }
  }
}
