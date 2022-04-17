targetScope = 'subscription'

param policyInputData object
param client string
output policyId string = br2_azure_backup_for_vm_policy.id

resource br2_azure_backup_for_vm_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-'
  properties: {
    displayName: '${client}-'
    policyType: 'Custom'
    mode: 'All'
    description: 'Ensure protection of your Azure Virtual Machines by enabling Azure Backup. Azure Backup is a secure and cost effective data protection solution for Azure.'
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
        allOf: [
          {
            field: 'type'
            equals: 'Microsoft.Compute/virtualMachines'
          }
          {
            field: 'id'
            notContains: '/resourceGroups/databricks-rg-'
          }
          {
            field: 'Microsoft.Compute/imagePublisher'
            notEquals: 'azureopenshift'
          }
          {
            field: 'Microsoft.Compute/imagePublisher'
            notEquals: 'AzureDatabricks'
          }
        ]
      }
      then: {
        effect: 'AuditIfNotExists'
        details: {
          type: 'Microsoft.RecoveryServices/backupprotecteditems'
        }
      }
    }
  }
}
