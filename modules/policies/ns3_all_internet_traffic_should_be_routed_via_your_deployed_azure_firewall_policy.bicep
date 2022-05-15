targetScope = 'subscription'

param client string
output policyId string = ns3_all_internet_traffic_should_be_routed_via_your_deployed_azure_firewall_policy.id
resource ns3_all_internet_traffic_should_be_routed_via_your_deployed_azure_firewall_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-All Internet traffic should be routed via your deployed Azure Firewall'
  properties: {
    displayName: '${client}-All Internet traffic should be routed via your deployed Azure Firewall'
    policyType: 'Custom'
    mode: 'All'
    description: 'Azure Security Center has identified that some of your subnets aren\'t protected with a next generation firewall. Protect your subnets from potential threats by restricting access to them with Azure Firewall or a supported next generation firewall'
    metadata: {
      version: '3.0.0-preview'
      category: 'Network'
      preview: true
    }
    policyRule: {
      if: {
        allOf: [
          {
            field: 'type'
            equals: 'Microsoft.Network/virtualNetworks'
          }
          {
            count: {
              field: 'Microsoft.Network/virtualNetworks/subnets[*]'
              where: {
                allOf: [
                  {
                    count: {
                      field: 'Microsoft.Network/virtualNetworks/subnets[*].ipConfigurations[*]'
                      where: {
                        value: '[empty(field(\'Microsoft.Network/virtualNetworks/subnets[*].ipConfigurations[*].id\'))]'
                        equals: false
                      }
                    }
                    greaterOrEquals: 2
                  }
                  {
                    field: 'Microsoft.Network/virtualNetworks/subnets[*].routeTable'
                    exists: false
                  }
                  {
                    not: {
                      anyOf: [
                        {
                          field: 'Microsoft.Network/virtualNetworks/subnets[*].name'
                          equals: 'AzureBastionSubnet'
                        }
                        {
                          field: 'Microsoft.Network/virtualNetworks/subnets[*].name'
                          equals: 'GatewaySubnet'
                        }
                      ]
                    }
                  }
                ]
              }
            }
            greater: 0
          }
        ]
      }
      then: {
        effect: 'AuditIfNotExists'
        details: {
          type: 'Microsoft.Network/azureFirewalls'
          existenceCondition: {
            count: {
              field: 'Microsoft.Network/azureFirewalls/ipConfigurations[*]'
              where: {
                field: 'Microsoft.Network/azureFirewalls/ipConfigurations[*].subnet.id'
                like: '[concat(\'/subscriptions/\', subscription().subscriptionId, \'/resourceGroups/*/providers/Microsoft.Network/virtualNetworks/\', first(split(field(\'fullName\'), \'/\')), \'/subnets/AzureFirewallSubnet\')]'
              }
            }
            equals: 1
          }
        }
      }
    }
  }
}
