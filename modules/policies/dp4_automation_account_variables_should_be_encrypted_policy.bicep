targetScope = 'subscription'

param policyInputData object
param client string
output policyId string = dp4_automation_account_variables_should_be_encrypted_policy.id

resource dp4_automation_account_variables_should_be_encrypted_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-'
  properties: {
    displayName: '${client}-'
    policyType: 'Custom'
    mode: 'All'
    description: 'It is important to enable encryption of Automation account variable assets when storing sensitive data'
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
            equals: 'Microsoft.Automation/automationAccounts/variables'
          }
          {
            field: 'Microsoft.Automation/automationAccounts/variables/isEncrypted'
            notEquals: 'true'
          }
        ]
      }
      then: {
        effect: 'Audit'
      }
    }
  }
}
