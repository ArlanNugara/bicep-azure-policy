targetScope = 'subscription'

param policyInputData object
param client string
output policyId string = firewall_internet_traffic_policy.id

resource firewall_internet_traffic_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-${policyInputData.name}'
  properties: {
    displayName: '${client}-${policyInputData.displayName}'
    policyType: 'Custom'
    mode: 'All'
    description: policyInputData.description
    metadata:{
      category:'Network'
    }
    parameters: {
      policyEffect: {
        type: 'String'
        metadata: {
          description: 'Policy Effect'
          displayName: 'The effect determines what happens when the policy rule is evaluated to match'
        }
        defaultValue: policyInputData.effect
      }
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
        effect: '[parameters(\'policyEffect\')]'
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
