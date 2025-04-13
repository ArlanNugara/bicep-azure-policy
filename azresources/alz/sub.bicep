targetScope = 'managementGroup'

@description('Target MG id.')
param mgId string

@description('Subscription to be moved.')
param subId string

resource move 'Microsoft.Management/managementGroups/subscriptions@2021-04-01' = {
  name: '${mgId}/${subId}'
  scope: tenant()
}
