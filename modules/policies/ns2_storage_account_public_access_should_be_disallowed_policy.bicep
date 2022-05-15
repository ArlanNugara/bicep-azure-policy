targetScope = 'subscription'

param client string
output policyId string = ns2_storage_account_public_access_should_be_disallowed_policy.id
resource ns2_storage_account_public_access_should_be_disallowed_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-Storage account public access should be disallowed'
  properties: {
    displayName: '${client}-Storage account public access should be disallowed'
    policyType: 'Custom'
    mode: 'Indexed'
    description: 'Anonymous public read access to containers and blobs in Azure Storage is a convenient way to share data but might present security risks. To prevent data breaches caused by undesired anonymous access, Microsoft recommends preventing public access to a storage account unless your scenario requires it.'
    metadata: {
      version: '3.1.0-preview'
      category: 'Storage'
      preview: true
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
