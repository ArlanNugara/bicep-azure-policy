targetScope = 'managementGroup'

param managementSubscriptionId string
param managementGroupId string
param managementRgName string
param workspaceName string
param vmInsightsDcrName string
param changeTrackingDcrName string
param builtIn array
param auditLogs object
param changeTracking object
param vmInsights object
param sqlDefender object
param vmMde object
param iaasAntiMalware object
param guestConfiguration object
param dependencyAgentInitiative object
param dependencyAgent object
param generalPolicyInitiative object
param general object
param computePolicyInitiative object
param compute object
param storagePolicyInitiative object
param storage object
param mySqlPolicyInitiative object
param mysql object
param psqlPolicyInitiative object
param psql object
param sqlPolicyInitiative object
param sql object
param networkPolicyInitiative object
param network object
param requiredTags array
param optionalTags array
param tag object
param location string

resource logAnalyticsWorkspaceExisting 'Microsoft.OperationalInsights/workspaces@2023-09-01' existing = {
  name: workspaceName
  scope: resourceGroup(managementSubscriptionId, managementRgName)
}

resource vmInsightsDcrExisting 'Microsoft.Insights/dataCollectionRules@2021-04-01' existing = {
  name: vmInsightsDcrName
  scope: resourceGroup(managementSubscriptionId, managementRgName)
}

resource changeTrackingDcrExisting 'Microsoft.Insights/dataCollectionRules@2021-04-01' existing = {
  name: changeTrackingDcrName
  scope: resourceGroup(managementSubscriptionId, managementRgName)
}

module allLogscategorySupportedResourcesPolicy '../azresources/policy/assignment.bicep' = {
  name: 'allAuditLogs-${auditLogs.assignmentName}'
  scope: managementGroup(managementGroupId)
  params: {
    name: auditLogs.assignmentName
    displayName: auditLogs.assignmentDisplayName
    location: location
    defId: auditLogs.initiativeId
    roleId: auditLogs.roleAssignmentId
    parameters: any({
      logAnalytics: {
        value: logAnalyticsWorkspaceExisting.id
      }
    })
  }
}

module vmInsightsPolicy '../azresources/policy/assignment.bicep' = {
  name: 'vmInsights-${vmInsights.assignmentName}'
  scope: managementGroup(managementGroupId)
  params: {
    name: vmInsights.assignmentName
    displayName: vmInsights.assignmentDisplayName
    location: location
    defId: vmInsights.initiativeId
    roleId: vmInsights.roleAssignmentId
    parameters: any({
      dcrResourceId: {
        value: vmInsightsDcrExisting.id
      }
      bringYourOwnUserAssignedManagedIdentity: {
        value: false
      }
    })
  }
}

module changeTrackingPolicy '../azresources/policy/assignment.bicep' = {
  name: 'changeTracking-${changeTracking.assignmentName}'
  scope: managementGroup(managementGroupId)
  params: {
    name: changeTracking.assignmentName
    displayName: changeTracking.assignmentDisplayName
    location: location
    defId: changeTracking.initiativeId
    roleId: changeTracking.roleAssignmentId
    parameters: any({
      dcrResourceId: {
        value: changeTrackingDcrExisting.id
      }
      bringYourOwnUserAssignedManagedIdentity: {
        value: false
      }
    })
  }
}

module sqlDefenderPolicy '../azresources/policy/assignment.bicep' = {
  name: 'sqldefender-${sqlDefender.assignmentName}'
  scope: managementGroup(managementGroupId)
  params: {
    name: sqlDefender.assignmentName
    displayName: sqlDefender.assignmentDisplayName
    location: location
    defId: sqlDefender.initiativeId
    roleId: sqlDefender.roleAssignmentId
    parameters: any({
      builtInIdentityResourceGroupLocation: {
        value: location
      }
      workspaceRegion: {
        value: location
      }
      userWorkspaceId: {
        value: logAnalyticsWorkspaceExisting.id
      }
      enableCollectionOfSqlQueriesForSecurityResearch: {
        value: true
      }
    })
  }
}

module vmMdePolicy '../azresources/policy/assignment.bicep' = {
  name: 'vmmde-${vmMde.assignmentName}'
  scope: managementGroup(managementGroupId)
  params: {
    name: vmMde.assignmentName
    displayName: vmMde.assignmentDisplayName
    location: location
    defId: vmMde.initiativeId
    roleId: vmMde.roleAssignmentId
    parameters: any({})
  }
}

module iaasAntiMalwarePolicy '../azresources/policy/assignment.bicep' = {
  name: 'vmiaas-${iaasAntiMalware.assignmentName}'
  scope: managementGroup(managementGroupId)
  params: {
    name: iaasAntiMalware.assignmentName
    displayName: iaasAntiMalware.assignmentDisplayName
    location: location
    defId: iaasAntiMalware.initiativeId
    roleId: iaasAntiMalware.roleAssignmentId
    parameters: any({})
  }
}

module guestConfigPolicy '../azresources/policy/assignment.bicep' = {
  name: 'vmguest-${guestConfiguration.assignmentName}'
  scope: managementGroup(managementGroupId)
  params: {
    name: guestConfiguration.assignmentName
    displayName: guestConfiguration.assignmentDisplayName
    location: location
    defId: guestConfiguration.initiativeId
    roleId: guestConfiguration.roleAssignmentId
    parameters: any({})
  }
}

module dependecyAgentInitiative '../azresources/policy/definitionset.bicep' = {
  name: 'dependencyagent-${dependencyAgentInitiative.name}'
  scope: managementGroup(managementGroupId)
  params: {
    defSetName: dependencyAgentInitiative.name
    displayName: dependencyAgentInitiative.displayName
    defList: dependencyAgentInitiative.defList
  }
}

module dependencyAgentPolicy '../azresources/policy/assignment.bicep' = {
  name: 'vmdependency-${dependencyAgent.assignmentName}'
  scope: managementGroup(managementGroupId)
  params: {
    name: dependencyAgent.assignmentName
    displayName: dependencyAgent.assignmentDisplayName
    location: location
    defId: dependecyAgentInitiative.outputs.outputPolicySetDefId
    roleId: dependencyAgent.roleAssignmentId
    parameters: any({})
  }
}

module generalInitiative '../azresources/policy/definitionset.bicep' = {
  name: 'genset-${generalPolicyInitiative.name}'
  scope: managementGroup(managementGroupId)
  params: {
    defSetName: generalPolicyInitiative.name
    displayName: generalPolicyInitiative.displayName
    defList: generalPolicyInitiative.defList
  }
}

module generalPolicy '../azresources/policy/assignment.bicep' = {
  name: 'gen-${general.assignmentName}'
  scope: managementGroup(managementGroupId)
  params: {
    name: general.assignmentName
    displayName: general.assignmentDisplayName
    location: location
    defId: generalInitiative.outputs.outputPolicySetDefId
    roleId: general.roleAssignmentId
    parameters: any({})
  }
}

module builtInPolicy '../azresources/policy/assignment.bicep' = [for pol in builtIn: {
  name: 'pol-${pol.assignmentName}'
  scope: managementGroup(managementGroupId)
  params: {
    name: pol.assignmentName
    displayName: pol.assignmentDisplayName
    location: location
    defId: pol.initiativeId
    roleId: pol.roleAssignmentId
    parameters: pol.parameters
  }
}]

module computeInitiative '../azresources/policy/definitionset.bicep' = {
  name: 'compset-${computePolicyInitiative.name}'
  scope: managementGroup(managementGroupId)
  params: {
    defSetName: computePolicyInitiative.name
    displayName: computePolicyInitiative.displayName
    defList: computePolicyInitiative.defList
  }
}

module computePolicy '../azresources/policy/assignment.bicep' = {
  name: 'comp-${compute.assignmentName}'
  scope: managementGroup(managementGroupId)
  params: {
    name: compute.assignmentName
    displayName: compute.assignmentDisplayName
    location: location
    defId: computeInitiative.outputs.outputPolicySetDefId
    roleId: compute.roleAssignmentId
    parameters: any({})
  }
}

module storageInitiative '../azresources/policy/definitionset.bicep' = {
  name: 'compset-${storagePolicyInitiative.name}'
  scope: managementGroup(managementGroupId)
  params: {
    defSetName: storagePolicyInitiative.name
    displayName: storagePolicyInitiative.displayName
    defList: storagePolicyInitiative.defList
  }
}

module storagePolicy '../azresources/policy/assignment.bicep' = {
  name: 'comp-${storage.assignmentName}'
  scope: managementGroup(managementGroupId)
  params: {
    name: storage.assignmentName
    displayName: storage.assignmentDisplayName
    location: location
    defId: storageInitiative.outputs.outputPolicySetDefId
    roleId: storage.roleAssignmentId
    parameters: any({})
  }
}

module mysqlInitiative '../azresources/policy/definitionset.bicep' = {
  name: 'compset-${mySqlPolicyInitiative.name}'
  scope: managementGroup(managementGroupId)
  params: {
    defSetName: mySqlPolicyInitiative.name
    displayName: mySqlPolicyInitiative.displayName
    defList: mySqlPolicyInitiative.defList
  }
}

module mysqlPolicy '../azresources/policy/assignment.bicep' = {
  name: 'comp-${mysql.assignmentName}'
  scope: managementGroup(managementGroupId)
  params: {
    name: mysql.assignmentName
    displayName: mysql.assignmentDisplayName
    location: location
    defId: mysqlInitiative.outputs.outputPolicySetDefId
    roleId: mysql.roleAssignmentId
    parameters: any({})
  }
}

module psqlInitiative '../azresources/policy/definitionset.bicep' = {
  name: 'compset-${psqlPolicyInitiative.name}'
  scope: managementGroup(managementGroupId)
  params: {
    defSetName: psqlPolicyInitiative.name
    displayName: psqlPolicyInitiative.displayName
    defList: psqlPolicyInitiative.defList
  }
}

module psqlPolicy '../azresources/policy/assignment.bicep' = {
  name: 'comp-${psql.assignmentName}'
  scope: managementGroup(managementGroupId)
  params: {
    name: psql.assignmentName
    displayName: psql.assignmentDisplayName
    location: location
    defId: psqlInitiative.outputs.outputPolicySetDefId
    roleId: psql.roleAssignmentId
    parameters: any({})
  }
}

module sqlInitiative '../azresources/policy/definitionset.bicep' = {
  name: 'compset-${sqlPolicyInitiative.name}'
  scope: managementGroup(managementGroupId)
  params: {
    defSetName: sqlPolicyInitiative.name
    displayName: sqlPolicyInitiative.displayName
    defList: sqlPolicyInitiative.defList
  }
}

module sqlPolicy '../azresources/policy/assignment.bicep' = {
  name: 'comp-${sql.assignmentName}'
  scope: managementGroup(managementGroupId)
  params: {
    name: sql.assignmentName
    displayName: sql.assignmentDisplayName
    location: location
    defId: sqlInitiative.outputs.outputPolicySetDefId
    roleId: sql.roleAssignmentId
    parameters: any({})
  }
}

module networkInitiative '../azresources/policy/definitionset.bicep' = {
  name: 'compset-${networkPolicyInitiative.name}'
  scope: managementGroup(managementGroupId)
  params: {
    defSetName: networkPolicyInitiative.name
    displayName: networkPolicyInitiative.displayName
    defList: networkPolicyInitiative.defList
  }
}

module networkPolicy '../azresources/policy/assignment.bicep' = {
  name: 'comp-${network.assignmentName}'
  scope: managementGroup(managementGroupId)
  params: {
    name: network.assignmentName
    displayName: network.assignmentDisplayName
    location: location
    defId: networkInitiative.outputs.outputPolicySetDefId
    roleId: network.roleAssignmentId
    parameters: any({})
  }
}

module requiredTagsDef '../azresources/policy/definition.bicep' = [for reqtag in requiredTags: {
  name: 'deploy-req-tag-${reqtag}'
  scope: managementGroup(managementGroupId)
  params: {
    defName: 'req-tag-${reqtag}'
    displayName: 'Required Tag - ${reqtag}'
    mode: 'Indexed'
    parameter: any({
      tagName: {
        type: 'String'
      }
      effect: {
        type: 'String'
        allowedValues: [
          'Audit'
          'Deny'
          'audit'
          'deny'
        ]
      }
    })
    rule: any({
      if: {
        field: '[concat(\'tags[\', parameters(\'tagName\'), \']\')]'
        exists: 'false'
      }
      then: {
        effect: '[parameters(\'effect\')]'
      }
    })
  }
}]

module optionalTagsDef '../azresources/policy/definition.bicep' = [for opttag in optionalTags: {
  name: 'deploy-opt-tag-${opttag}'
  scope: managementGroup(managementGroupId)
  params: {
    defName: 'opt-tag-${opttag}'
    displayName: 'Optional Tag - ${opttag}'
    mode: 'Indexed'
    parameter: any({
      tagName: {
        type: 'String'
      }
      effect: {
        type: 'String'
        allowedValues: [
          'Audit'
          'Deny'
          'audit'
          'deny'
        ]
      }
    })
    rule: any({
      if: {
        field: '[concat(\'tags[\', parameters(\'tagName\'), \']\')]'
        exists: 'false'
      }
      then: {
        effect: '[parameters(\'effect\')]'
      }
    })
  }
}]

module createdDateTag '../azresources/policy/definition.bicep' = {
  name: 'deploy-tag-CreatedOn'
  scope: managementGroup(managementGroupId)
  params: {
    defName: 'add-tag-CreatedOn'
    displayName: 'Additional tag - CreatedOn'
    mode: 'All'
    parameter: any({})
    rule: any({
      if: {
        allOf: [
          {
            field: 'tags[\'CreatedOnDateUTC\']'
            exists: 'false'
          }
        ]
      }
      then: {
        effect: 'append'
        details: [
          {
            field: 'tags[\'CreatedOnDateUTC\']'
            value: '[utcNow()]'
          }
        ]
      }
    })
  }
}

module tagInitiative '../azresources/policy/definitionset.bicep' = {
  name: 'deploy-tag-initiative'
  scope: managementGroup(managementGroupId)
  params: {
    defSetName: 'tag-set'
    displayName: 'Tag Governance'
    defList: [
      {
        parameters: any({
          tagName: {
            value: 'Department'
          }
          effect: {
            value: 'audit'
          }
        })
        policyDefinitionId: '/providers/Microsoft.Management/managementGroups/${managementGroupId}/providers/Microsoft.Authorization/policyDefinitions/req-tag-Department'
      }
      {
        parameters: any({
          tagName: {
            value: 'Environment'
          }
          effect: {
            value: 'audit'
          }
        })
        policyDefinitionId: '/providers/Microsoft.Management/managementGroups/${managementGroupId}/providers/Microsoft.Authorization/policyDefinitions/req-tag-Environment'
      }
      {
        parameters: any({
          tagName: {
            value: 'Owner'
          }
          effect: {
            value: 'audit'
          }
        })
        policyDefinitionId: '/providers/Microsoft.Management/managementGroups/${managementGroupId}/providers/Microsoft.Authorization/policyDefinitions/req-tag-Owner'
      }
      {
        parameters: any({
          tagName: {
            value: 'Project'
          }
          effect: {
            value: 'audit'
          }
        })
        policyDefinitionId: '/providers/Microsoft.Management/managementGroups/${managementGroupId}/providers/Microsoft.Authorization/policyDefinitions/req-tag-Project'
      }
      {
        parameters: any({
          tagName: {
            value: 'CreatedBy'
          }
          effect: {
            value: 'audit'
          }
        })
        policyDefinitionId: '/providers/Microsoft.Management/managementGroups/${managementGroupId}/providers/Microsoft.Authorization/policyDefinitions/opt-tag-CreatedBy'
      }
      {
        parameters: any({
          tagName: {
            value: 'Application'
          }
          effect: {
            value: 'audit'
          }
        })
        policyDefinitionId: '/providers/Microsoft.Management/managementGroups/${managementGroupId}/providers/Microsoft.Authorization/policyDefinitions/opt-tag-Application'
      }
      {
        parameters: any({})
        policyDefinitionId: '/providers/Microsoft.Management/managementGroups/${managementGroupId}/providers/Microsoft.Authorization/policyDefinitions/add-tag-CreatedOn'
      }
    ]
  }
}

module tagPolicy '../azresources/policy/assignment.bicep' = {
  name: 'tag-${tag.assignmentName}'
  scope: managementGroup(managementGroupId)
  params: {
    name: tag.assignmentName
    displayName: tag.assignmentDisplayName
    location: location
    defId: tagInitiative.outputs.outputPolicySetDefId
    roleId: tag.roleAssignmentId
    parameters: any({})
  }
}
