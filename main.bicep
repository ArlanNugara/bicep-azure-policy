targetScope = 'subscription'

param policyInitiativeArray array

//Create Policy
module policyM 'modules/policy.bicep' = [for (pol, i) in policyInitiativeArray: {
  name: 'Policy-${i}'
  params: {
    policyData: pol
  }
}]
