targetScope = 'subscription'

param policyInputData object
param client string
output policyId string = tags_optional_policy.id

resource tags_optional_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
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
      policyEffect: {
        type: 'String'
        metadata: {
          description: 'Policy Effect'
          displayName: 'The effect determines what happens when the policy rule is evaluated to match'
        }
        defaultValue: policyInputData.effect
      }
      App: {
        type: 'String'
        metadata: {
          displayName: 'Env Tag'
        }
        defaultValue: policyInputData.tags.app
      }
      CostCenter: {
        type: 'String'
        metadata: {
          displayName: 'Cost Center Tag'
        }
        defaultValue: policyInputData.tags.costCenter
      }
      Department: {
        type: 'String'
        metadata: {
          displayName: 'Department Tag'
        }
        defaultValue: policyInputData.tags.department
      }
      Owner: {
        type: 'String'
        metadata: {
          displayName: 'Owner Tag'
        }
        defaultValue: policyInputData.tags.owner
      }
      Policy: {
        type: 'String'
        metadata: {
          displayName: 'Policy Tag'
        }
        defaultValue: policyInputData.tags.policy
      }
      Product: {
        type: 'String'
        metadata: {
          displayName: 'Product Tag'
        }
        defaultValue: policyInputData.tags.product
      }
      SalesforceCSTID: {
        type: 'String'
        metadata: {
          displayName: 'Salesforce CST ID Tag'
        }
        defaultValue: policyInputData.tags.salesforceCSTID
      }
      SLASeverity: {
        type: 'String'
        metadata: {
          displayName: 'SLA Severity Tag'
        }
        defaultValue: policyInputData.tags.slaSeverity
      }
      Stakeholders: {
        type: 'String'
        metadata: {
          displayName: 'Stakeholders Tag'
        }
        defaultValue: policyInputData.tags.stakeholders
      }
      Tiers: {
        type: 'String'
        metadata: {
          displayName: 'Tiers Tag'
        }
        defaultValue: policyInputData.tags.tiers
      }
    }
    policyRule: {
      if: {
        anyOf: [
          {
            field: '[concat(\'tags[\', parameters(\'App\'), \']\')]'
            exists: false
          }
          {
            field: '[concat(\'tags[\', parameters(\'CostCenter\'), \']\')]'
            exists: false
          }
          {
            field: '[concat(\'tags[\', parameters(\'Department\'), \']\')]'
            exists: false
          }
          {
            field: '[concat(\'tags[\', parameters(\'Owner\'), \']\')]'
            exists: false
          }
          {
            field: '[concat(\'tags[\', parameters(\'Policy\'), \']\')]'
            exists: false
          }
          {
            field: '[concat(\'tags[\', parameters(\'Product\'), \']\')]'
            exists: false
          }
          {
            field: '[concat(\'tags[\', parameters(\'SalesforceCSTID\'), \']\')]'
            exists: false
          }
          {
            field: '[concat(\'tags[\', parameters(\'SLASeverity\'), \']\')]'
            exists: false
          }
          {
            field: '[concat(\'tags[\', parameters(\'Stakeholders\'), \']\')]'
            exists: false
          }
          {
            field: '[concat(\'tags[\', parameters(\'Tiers\'), \']\')]'
            exists: false
          }
        ]
      }
      then: {
        effect: '[parameters(\'policyEffect\')]'
      }
    }
  }
}
