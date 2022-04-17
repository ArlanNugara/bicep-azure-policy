targetScope = 'subscription'

param policyInputData object
param client string
output policyId string = dp5_azure_machine_learning_workspaces_should_be_encrypted_with_a_customer_managed_key_policy.id

resource dp5_azure_machine_learning_workspaces_should_be_encrypted_with_a_customer_managed_key_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-'
  properties: {
    displayName: '${client}-'
    policyType: 'Custom'
    mode: 'All'
    description: 'Manage encryption at rest of Azure Machine Learning workspace data with customer-managed keys. By default, customer data is encrypted with service-managed keys, but customer-managed keys are commonly required to meet regulatory compliance standards. Customer-managed keys enable the data to be encrypted with an Azure Key Vault key created and owned by you. You have full control and responsibility for the key lifecycle, including rotation and management. Learn more at https://aka.ms/azureml-workspaces-cmk.'
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
            equals: 'Microsoft.MachineLearningServices/workspaces'
          }
          {
            not: {
              field: 'Microsoft.MachineLearningServices/workspaces/encryption.status'
              equals: 'enabled'
            }
          }
        ]
      }
      then: {
        effect: 'Audit'
      }
    }
  }
}
