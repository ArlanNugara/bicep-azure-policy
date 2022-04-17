targetScope = 'subscription'

param policyInputData object
param client string
output policyId string = dp7_certificates_should_have_the_specified_maximum_validity_period_policy.id

resource dp7_certificates_should_have_the_specified_maximum_validity_period_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-'
  properties: {
    displayName: '${client}-'
    policyType: 'Custom'
    mode: 'All'
    description: 'Manage your organizational compliance requirements by specifying the maximum amount of time that a certificate can be valid within your key vault.'
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
        allOf: [
          {
            field: 'type'
            equals: 'Microsoft.KeyVault.Data/vaults/certificates'
          }
          {
            field: 'Microsoft.KeyVault.Data/vaults/certificates/properties.validityInMonths'
            greater: '[parameters(\'maximumValidityInMonths\')]'
          }
        ]
      }
      then: {
        effect: 'Audit'
      }
    }
  }
}
