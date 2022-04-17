targetScope = 'subscription'

param policyInputData object
param client string
output policyId string = dp2_azure_defender_for_open_source_relational_databases_should_be_enabled_policy.id

resource dp2_azure_defender_for_open_source_relational_databases_should_be_enabled_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-'
  properties: {
    displayName: '${client}-'
    policyType: 'Custom'
    mode: 'All'
    description: 'Azure Defender for open-source relational databases detects anomalous activities indicating unusual and potentially harmful attempts to access or exploit databases. Learn more about the capabilities of Azure Defender for open-source relational databases at https://aka.ms/AzDforOpenSourceDBsDocu. Important: Enabling this plan will result in charges for protecting your open-source relational databases. Learn about the pricing on Security Centers pricing page: https://aka.ms/pricing-security-center'
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
        field: 'type'
        equals: 'Microsoft.Resources/subscriptions'
      }
      then: {
        effect: 'AuditIfNotExists'
        details: {
          type: 'Microsoft.Security/pricings'
          name: 'OpenSourceRelationalDatabases'
          existenceScope: 'subscription'
          existenceCondition: {
            field: 'Microsoft.Security/pricings/pricingTier'
            equals: 'Standard'
          }
        }
      }
    }
  }
}
