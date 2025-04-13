using '../deployment/mg.bicep'

param rootManagementGroupId = readEnvironmentVariable('ROOT_PARENT_MANAGEMENT_GROUP_ID')

param firstLevelMGs = [
  {
    id: 'mg-platform-lz'
    displayName: 'Platform'
    parentId: rootManagementGroupId
  }
  {
    id: 'mg-app-lz'
    displayName: 'Application'
    parentId: rootManagementGroupId
  }
  {
    id: 'mg-sbx'
    displayName: 'Sandbox'
    parentId: rootManagementGroupId
  }
  {
    id: 'mg-decommisisoned'
    displayName: 'Decommissioned'
    parentId: rootManagementGroupId
  }
  {
    id: 'mg-unmanaged'
    displayName: 'Unmanaged'
    parentId: rootManagementGroupId
  }
]

param secondLevelMGs = [
  {
    id: 'mg-platform-lz-connectivity'
    displayName: 'Connectivity'
    parentId: 'mg-platform-lz'
  }
  {
    id: 'mg-platform-lz-identity'
    displayName: 'Identity'
    parentId: 'mg-platform-lz'
  }
  {
    id: 'mg-platform-lz-management'
    displayName: 'Management'
    parentId: 'mg-platform-lz'
  }
  {
    id: 'mg-platform-lz-security'
    displayName: 'Security'
    parentId: 'mg-platform-lz'
  }
  {
    id: 'mg-app-lz-prd'
    displayName: 'Production'
    parentId: 'mg-app-lz'
  }
  {
    id: 'mg-app-lz-nonprd'
    displayName: 'Development'
    parentId: 'mg-app-lz'
  }
]
