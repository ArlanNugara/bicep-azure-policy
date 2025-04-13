targetScope = 'managementGroup'

param subscriptionPlacement array
param managementSubscriptionId string
param connectivitySubscriptionId1 string
param connectivitySubscriptionId2 string
param identitySubscriptionId string
param sandboxSubscriptionId string

module movesub '../azresources/alz/sub.bicep' = [for sub in subscriptionPlacement: {
  name: 'move-sub-${sub.subName}-to-mg-${sub.mgId}'
  params: {
    mgId: sub.mgId
    subId: sub.subId
  }
}]
