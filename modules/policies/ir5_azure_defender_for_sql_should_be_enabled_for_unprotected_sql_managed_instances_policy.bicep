targetScope = 'subscription'

param policyInputData object
param client string
output policyId string = ir5_azure_defender_for_sql_should_be_enabled_for_unprotected_sql_managed_instances_policy.id

resource ir5_azure_defender_for_sql_should_be_enabled_for_unprotected_sql_managed_instances_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-'
  properties: {
    displayName: '${client}-'
    policyType: 'Custom'
    mode: 'All'
    description: 'Audit each SQL Managed Instance without advanced data security.'
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
        field: 'type'
        equals: 'Microsoft.Sql/managedInstances'
      }
      then: {
        effect: 'AuditIfNotExists'
        details: {
          type: 'Microsoft.Sql/managedInstances/securityAlertPolicies'
          name: 'Default'
          existenceCondition: {
            field: 'Microsoft.Sql/managedInstances/securityAlertPolicies/state'
            equals: 'Enabled'
          }
        }
      }
    }
  }
}
