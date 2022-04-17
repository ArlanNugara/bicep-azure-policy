targetScope = 'subscription'

param policyInputData object
param client string
output policyId string = ns2_storage_account_public_access_should_be_disallowed_policy.id

resource ns2_storage_account_public_access_should_be_disallowed_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-'
  properties: {
    displayName: '${client}-'
    policyType: 'Custom'
    mode: 'All'
    description: 'Anonymous public read access to containers and blobs in Azure Storage is a convenient way to share data but might present security risks. To prevent data breaches caused by undesired anonymous access, Microsoft recommends preventing public access to a storage account unless your scenario requires it.'
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
            equals: 'Microsoft.Storage/storageAccounts'
          }
          {
            not: {
              allOf: [
                {
                  field: 'id'
                  contains: '/resourceGroups/aro-'
                }
                {
                  anyOf: [
                    {
                      field: 'name'
                      like: 'cluster*'
                    }
                    {
                      field: 'name'
                      like: 'imageregistry*'
                    }
                  ]
                }
              ]
            }
          }
          {
            not: {
              field: 'Microsoft.Storage/storageAccounts/allowBlobPublicAccess'
              equals: 'false'
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
