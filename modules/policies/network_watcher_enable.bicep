targetScope = 'subscription'

param policyInputData object
param client string
output policyId string = network_watcher_enable_policy.id

resource network_watcher_enable_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-${policyInputData.name}'
  properties: {
    displayName: '${client}-${policyInputData.displayName}'
    policyType: 'Custom'
    mode: 'All'
    description: policyInputData.description
    metadata: {
      category: 'Networking'
    }
    parameters: {
      inputParam1: {
        type: 'String'
        metadata: {
          description: 'Enable or disable the execution of the policy'
          displayName: 'Audit if Network Watchers not Present'
        }
        defaultValue: policyInputData.effect
      }
      resourceGroupName: {
        type: 'String'
        metadata: {
          displayName: 'NetworkWatcher resource group name'
          description: 'Name of the resource group of NetworkWatcher, such as NetworkWatcherRG. This is the resource group where the Network Watchers are located.'
        }
        defaultValue: policyInputData.RGName
      }
    }
    policyRule: {
      if: {
        field: 'type'
        equals: 'Microsoft.Network/virtualNetworks'
      }
      then: {
        effect: '[parameters(\'inputParam1\')]'
        details: {
          type: 'Microsoft.Network/networkWatchers'
          resourceGroupName: '[parameters(\'resourceGroupName\')]'
          existenceCondition: {
            field: 'location'
            equals: '[field(\'location\')]'
          }
        }
      }
    }
  }
}
