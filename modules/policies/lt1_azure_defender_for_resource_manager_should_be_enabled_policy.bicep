targetScope = 'subscription'

param policyInputData object
param client string
output policyId string = lt1_azure_defender_for_resource_manager_should_be_enabled_policy.id

resource lt1_azure_defender_for_resource_manager_should_be_enabled_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-'
  properties: {
    displayName: '${client}-'
    policyType: 'Custom'
    mode: 'All'
    description: 'Azure Defender for Resource Manager automatically monitors the resource management operations in your organization. Azure Defender detects threats and alerts you about suspicious activity. Learn more about the capabilities of Azure Defender for Resource Manager at https://aka.ms/defender-for-resource-manager . Enabling this Azure Defender plan results in charges. Learn about the pricing details per region on Security Centers pricing page: https://aka.ms/pricing-security-center .'
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
          name: 'Arm'
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