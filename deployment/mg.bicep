targetScope = 'managementGroup'

param firstLevelMGs array
param secondLevelMGs array

// Deploy the First Level MG here
module firstLevelMG '../azresources/alz/mg.bicep' = [for mgs in firstLevelMGs: {
  name: 'deploy_mg-${mgs.id}'
  params: {
    mgs : firstLevelMGs
  }
}]

// Deploy the Second Level MG here
module secondLevelMG '../azresources/alz/mg.bicep' = [for mgs in secondLevelMGs: {
  name: 'deploy_mg-${mgs.id}'
  params: {
    mgs : secondLevelMGs
  }
  dependsOn: [
    firstLevelMG
  ]
}]
