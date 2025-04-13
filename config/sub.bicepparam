using '../deployment/sub.bicep'

param managementSubscriptionId = readEnvironmentVariable('MANAGEMENT_SUBSCRIPTION_ID')
param connectivitySubscriptionId1 = readEnvironmentVariable('CONNECTIVITY_SUBSCRIPTION_ID_1')
param connectivitySubscriptionId2 = readEnvironmentVariable('CONNECTIVITY_SUBSCRIPTION_ID_2')
param identitySubscriptionId = readEnvironmentVariable('IDENTITY_SUBSCRIPTION_ID')
param sandboxSubscriptionId = readEnvironmentVariable('SANDBOX_SUBSCRIPTION_ID')

param subscriptionPlacement = [
  {
    subName: 'management'
    subId: managementSubscriptionId
    mgId: 'mg-platform-lz-management'
  }
  {
    subName: 'connectivity1'
    subId: connectivitySubscriptionId1
    mgId: 'mg-platform-lz-connectivity'
  }
  {
    subName: 'connectivity2'
    subId: connectivitySubscriptionId2
    mgId: 'mg-platform-lz-connectivity'
  }
  {
    subName: 'sandbox'
    subId: sandboxSubscriptionId
    mgId: 'mg-sbx'
  }
  {
    subName: 'identity'
    subId: identitySubscriptionId
    mgId: 'mg-platform-lz-identity'
  }
]
