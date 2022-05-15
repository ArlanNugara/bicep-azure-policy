targetScope = 'subscription'

param client string
output policyId string = dp7_certificates_should_have_the_specified_maximum_validity_period_policy.id
resource dp7_certificates_should_have_the_specified_maximum_validity_period_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-Certificates should have the specified maximum validity period'
  properties: {
    displayName: '${client}-Certificates should have the specified maximum validity period'
    policyType: 'Custom'
    mode: 'Microsoft.KeyVault.Data'
    description: 'Manage your organizational compliance requirements by specifying the maximum amount of time that a certificate can be valid within your key vault.'
    metadata: {
      version: '2.2.0-preview'
      category: 'Key Vault'
      preview: true
    }
    parameters: {
      maximumValidityInMonths: {
        type: 'Integer'
        metadata: {
          displayName: 'The maximum validity in months'
          description: 'The limit to how long a certificate may be valid for. Certificates with lengthy validity periods aren\'t best practice.'
        }
        defaultValue: 12
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
