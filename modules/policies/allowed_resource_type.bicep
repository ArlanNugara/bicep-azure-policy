targetScope = 'subscription'

param policyInputData object
param client string
output policyId string = allowed_resource_type_policy.id

resource allowed_resource_type_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-${policyInputData.name}'
  properties: {
    displayName: '${client}-${policyInputData.displayName}'
    policyType: 'Custom'
    mode: 'All'
    description: policyInputData.description
    metadata:{
      category: 'General'
    }
    parameters: {
      AllowedResourcesTypes: {
        type: 'Array'
        metadata: {
          description: 'The List of Allowed Locations for Resource Groups and Resources.'
          displayName: 'Allowed ASG Prefix'
        }
        defaultValue: policyInputData.resourceList
      }
    }
    policyRule: {
      if: {
        not: {
          field: 'type'
          in: '[parameters(\'AllowedResourcesTypes\')]'
        }
      }
      then: {
        effect: policyInputData.effect
      }
    }
  }
}
