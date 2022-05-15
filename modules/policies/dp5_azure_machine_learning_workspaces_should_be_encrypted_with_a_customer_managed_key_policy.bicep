targetScope = 'subscription'

param client string
output policyId string = dp5_azure_machine_learning_workspaces_should_be_encrypted_with_a_customer_managed_key_policy.id
resource dp5_azure_machine_learning_workspaces_should_be_encrypted_with_a_customer_managed_key_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-Azure Machine Learning workspaces should be encrypted with a customer-managed key'
  properties: {
    displayName: '${client}-Azure Machine Learning workspaces should be encrypted with a customer-managed key'
    policyType: 'Custom'
    mode: 'Indexed'
    description: 'Manage encryption at rest of Azure Machine Learning workspace data with customer-managed keys. By default, customer data is encrypted with service-managed keys, but customer-managed keys are commonly required to meet regulatory compliance standards. Customer-managed keys enable the data to be encrypted with an Azure Key Vault key created and owned by you. You have full control and responsibility for the key lifecycle, including rotation and management. Learn more at https://aka.ms/azureml-workspaces-cmk.'
    metadata: {
      version: '1.0.3'
      category: 'Machine Learning'
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
