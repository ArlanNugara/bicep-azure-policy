targetScope = 'subscription'

param policyInputData object
param client string
output policyId string = allowed_subnets_for_public_ip_policy.id

resource allowed_subnets_for_public_ip_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
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
     subnetPIPAllowedNames: {
        type: 'Array'
        metadata: {
          description: 'Allowed Subnet For Public IP'
          displayName: 'Allowed Subnet For Public IP'
        }
        defaultValue: policyInputData.listOfAllowedSubnets
      }
    }
    policyRule: {
      if: {
        allOf: [
      {
        field: 'type'
        equals: 'Microsoft.Network/networkInterfaces'
      }
      {
        not: {
          field: 'Microsoft.Network/networkInterfaces/ipconfigurations[*].publicIpAddress.id'
          exists: false
        }
      }
      {
        not: {
          field: 'Microsoft.Network/networkInterfaces/ipconfigurations[*].subnet.id'
          in: '[parameters(\'subnetPIPAllowedNames\')]'
        }
      }
    ]
  }
  then: {
    effect: policyInputData.effect
  }
    }
  }
}
