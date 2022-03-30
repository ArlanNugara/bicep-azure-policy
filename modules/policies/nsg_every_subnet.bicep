targetScope = 'subscription'

param policyInputData object
param client string
output policyId string = nsg_every_subnet_policy.id

resource nsg_every_subnet_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-${policyInputData.name}'
  properties: {
    displayName: '${client}-${policyInputData.displayName}'
    policyType: 'Custom'
    mode: 'All'
    description: policyInputData.description
    metadata:{
      category:'Networking'
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
            equals: 'Microsoft.Network/virtualNetworks/subnets'
          }
          {
            field: 'Microsoft.Network/virtualNetworks/subnets/networkSecurityGroup'
            exists: false
          }
          {
            not: {
              field: 'name'
              equals: 'GatewaySubnet'
            }
          }
          {
            not: {
              field: 'name'
              equals: 'AzureBastionSubnet'
            }
          }
          {
            not: {
              field: 'name'
              equals: 'AzureFirewallSubnet'
            }
          }
        ]
      }
      then: {
        effect: '[parameters(\'policyEffect\')]'
      }
    }
  }
}
