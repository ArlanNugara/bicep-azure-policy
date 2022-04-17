targetScope = 'subscription'

param policyInputData object
param client string
output policyId string = dp5_container_registries_should_be_encrypted_with_a_customer_managed_key_policy.id

resource dp5_container_registries_should_be_encrypted_with_a_customer_managed_key_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-'
  properties: {
    displayName: '${client}-'
    policyType: 'Custom'
    mode: 'All'
    description: 'Use customer-managed keys to manage the encryption at rest of the contents of your registries. By default, the data is encrypted at rest with service-managed keys, but customer-managed keys are commonly required to meet regulatory compliance standards. Customer-managed keys enable the data to be encrypted with an Azure Key Vault key created and owned by you. You have full control and responsibility for the key lifecycle, including rotation and management. Learn more at https://aka.ms/acr/CMK.'
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
            equals: 'Microsoft.ContainerRegistry/registries'
          }
          {
            field: 'Microsoft.ContainerRegistry/registries/encryption.status'
            notEquals: 'enabled'
          }
        ]
      }
      then: {
        effect: 'Audit'
      }
    }
  }
}
