targetScope = 'subscription'

//Create Policy
module policyM 'modules/policy.bicep' = [for (pol, i) in policyInitiativeArray: {
  name: 'Policy-${i}'
  params: {
    policyData: pol
  }
}]
