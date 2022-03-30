targetScope = 'subscription'

param policyInputData object
param client string
output policyId string = allowed_regions_policy.id

resource allowed_regions_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-${policyInputData.name}'
  properties: {
    displayName: '${client}-${policyInputData.displayName}'
    policyType: 'Custom'
    mode: 'All'
    description: policyInputData.description
    metadata: {
      category: 'General'
    }
    parameters: {
      regAllowedRegions: {
        type: 'Array'
        defaultValue: policyInputData.listOfAllowedLocations
      }
    }
    policyRule: {
      if: {
        allOf: [
          {
            field: 'location'
            notIn: '[parameters(\'regAllowedRegions\')]'
          }
          {
            field: 'location'
            notEquals: 'global'
          }
          {
            field: 'type'
            notEquals: 'Microsoft.AzureActiveDirectory/b2cDirectories'
          }
        ]
      }
      then: {
        effect: policyInputData.effect
      }
    }
  }
}
