targetScope = 'subscription'

param client string
output policyId string = ir4_network_watcher_should_be_enabled_policy.id
resource ir4_network_watcher_should_be_enabled_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-Network Watcher should be enabled'
  properties: {
    displayName: '${client}-Network Watcher should be enabled'
    policyType: 'Custom'
    mode: 'All'
    description: 'Network Watcher is a regional service that enables you to monitor and diagnose conditions at a network scenario level in, to, and from Azure. Scenario level monitoring enables you to diagnose problems at an end to end network level view. It is required to have a network watcher resource group to be created in every region where a virtual network is present. An alert is enabled if a network watcher resource group is not available in a particular region.'
    metadata: {
      version: '3.0.0'
      category: 'Network'
    }
    parameters: {
      listOfLocations: {
        type: 'Array'
        metadata: {
          displayName: '[Deprecated]: Locations'
          description: 'Audit if Network Watcher is not enabled for region(s).'
          strongType: 'location'
          deprecated: true
        }
        defaultValue: []
      }
      resourceGroupName: {
        type: 'String'
        metadata: {
          displayName: 'NetworkWatcher resource group name'
          description: 'Name of the resource group of NetworkWatcher, such as NetworkWatcherRG. This is the resource group where the Network Watchers are located.'
        }
        defaultValue: 'NetworkWatcherRG'
      }
    }
    policyRule: {
      if: {
        field: 'type'
        equals: 'Microsoft.Network/virtualNetworks'
      }
      then: {
        effect: 'AuditIfNotExists'
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
