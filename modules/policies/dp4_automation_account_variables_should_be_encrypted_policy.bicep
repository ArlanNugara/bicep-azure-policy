targetScope = 'subscription'

param client string
output policyId string = dp4_automation_account_variables_should_be_encrypted_policy.id
resource dp4_automation_account_variables_should_be_encrypted_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-Automation account variables should be encrypted'
  properties: {
    displayName: '${client}-Automation account variables should be encrypted'
    policyType: 'Custom'
    mode: 'All'
    description: 'It is important to enable encryption of Automation account variable assets when storing sensitive data'
    metadata: {
      version: '1.1.0'
      category: 'Automation'
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
