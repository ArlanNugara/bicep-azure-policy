targetScope = 'subscription'

param policyInputData object
param client string
output policyId string = allowed_storage_account_SKUs_policy.id

resource allowed_storage_account_SKUs_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-${policyInputData.name}'
  properties: {
    displayName: '${client}-${policyInputData.displayName}'
    policyType: 'Custom'
    mode: 'All'
    description: policyInputData.description
    metadata:{
      category:'Storage'
    }
    parameters: {
      saSKUsAllowedNames: {
        type: 'Array'
        metadata: {
          description: 'Allowed SA SKUs'
          displayName: 'Allowed SA SKUs'
        }
        defaultValue: policyInputData.listOfAllowedSKUs
      }
    }
    policyRule: {
      if: {
        allOf: [
          {
            field: 'type'
            equals: 'Microsoft.Storage/storageAccounts'
          }
          {
            not: {
              field: 'Microsoft.Storage/storageAccounts/sku.name'
              in: '[parameters(\'saSKUsAllowedNames\')]'
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
