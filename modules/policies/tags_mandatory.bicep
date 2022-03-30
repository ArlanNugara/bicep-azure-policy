targetScope = 'subscription'

param policyInputData object
param client string
output policyId string = tags_mandatory_policy.id

resource tags_mandatory_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-${policyInputData.name}'
  properties: {
    displayName: '${client}-${policyInputData.displayName}'
    policyType: 'Custom'
    mode: 'Indexed'
    description: policyInputData.description
    metadata: {
      category: 'General'
    }
    parameters: {
      Env: {
        type: 'String'
        metadata: {
          displayName: 'Env Tag'
        }
        defaultValue: policyInputData.tags.env
      }
      Customer: {
        type: 'String'
        metadata: {
          displayName: 'Customer Tag'
        }
        defaultValue: policyInputData.tags.customer
      }
      Region: {
        type: 'String'
        metadata: {
          displayName: 'Region Tag'
        }
        defaultValue: policyInputData.tags.region
      }
      CreatedBy: {
        type: 'String'
        metadata: {
          displayName: 'Created By Tag'
        }
        defaultValue: policyInputData.tags.createdBy
      }
    }
    policyRule: {
      if: {
        allOf: [
          {
            field: '[concat(\'tags[\', parameters(\'Env\'), \']\')]'
            exists: false
          }
          {
            field: '[concat(\'tags[\', parameters(\'Customer\'), \']\')]'
            exists: false
          }
          {
            field: '[concat(\'tags[\', parameters(\'Region\'), \']\')]'
            exists: false
          }
          {
            field: '[concat(\'tags[\', parameters(\'CreatedBy\'), \']\')]'
            exists: false
          }
        ]
      }
      then: {
        effect: policyInputData.effect
      }
    }
  }
}
