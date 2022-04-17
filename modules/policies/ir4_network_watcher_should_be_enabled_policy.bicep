targetScope = 'subscription'

param policyInputData object
param client string
output policyId string = ir4_network_watcher_should_be_enabled_policy.id

resource ir4_network_watcher_should_be_enabled_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-'
  properties: {
    displayName: '${client}-'
    policyType: 'Custom'
    mode: 'All'
    description: 'Network Watcher is a regional service that enables you to monitor and diagnose conditions at a network scenario level in, to, and from Azure. Scenario level monitoring enables you to diagnose problems at an end to end network level view. It is required to have a network watcher resource group to be created in every region where a virtual network is present. An alert is enabled if a network watcher resource group is not available in a particular region.'
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
