targetScope = 'subscription'

param policyInputData object
param client string
output policyId string = ssl_storage_secure_transfer_setting_policy.id

resource ssl_storage_secure_transfer_setting_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-${policyInputData.name}'
  properties: {
    displayName: '${client}-${policyInputData.displayName}'
    policyType: 'Custom'
    mode: 'All'
    description: policyInputData.description
    metadata: {
      category: 'Storage'
    }
    parameters: {
      sslStorageTransferAllowedNames: {
        type: 'String'
        metadata: {
          description: 'Audit Parameter SSL Storage Transfer'
          displayName: 'SSL Storage Transfer'
        }
        defaultValue: policyInputData.effect
      }
    }
    policyRule: {
      if: {
        allOf: [
          {
            field: 'type'
            equals: 'Microsoft.Storage/storageAccounts'
          }
          {
            anyOf: [
              {
                allOf: [
                  {
                    value: '[requestContext().apiVersion]'
                    less: '2019-04-01'
                  }
                  {
                    field: 'Microsoft.Storage/storageAccounts/supportsHttpsTrafficOnly'
                    exists: 'false'
                  }
                ]
              }
              {
                field: 'Microsoft.Storage/storageAccounts/supportsHttpsTrafficOnly'
                equals: 'false'
              }
            ]
          }
        ]
      }
      then: {
        effect: '[parameters(\'sslStorageTransferAllowedNames\')]'
      }
    }
  }
}
