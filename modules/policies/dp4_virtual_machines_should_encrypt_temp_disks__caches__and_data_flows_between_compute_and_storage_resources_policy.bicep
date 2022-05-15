targetScope = 'subscription'

param client string
output policyId string = dp4_virtual_machines_should_encrypt_temp_disks__caches__and_data_flows_between_compute_and_storage_resources_policy.id
resource dp4_virtual_machines_should_encrypt_temp_disks__caches__and_data_flows_between_compute_and_storage_resources_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-Virtual machines should encrypt temp disks, caches, and data flows between Compute and Storage resources'
  properties: {
    displayName: '${client}-Virtual machines should encrypt temp disks, caches, and data flows between Compute and Storage resources'
    policyType: 'Custom'
    mode: 'All'
    description: 'By default, a virtual machine\'s OS and data disks are encrypted-at-rest using platform-managed keys. Temp disks, data caches and data flowing between compute and storage aren\'t encrypted. Disregard this recommendation if: 1. using encryption-at-host, or 2. server-side encryption on Managed Disks meets your security requirements. Learn more in: Server-side encryption of Azure Disk Storage: https://aka.ms/disksse, Different disk encryption offerings: https://aka.ms/diskencryptioncomparison'
    metadata: {
      version: '2.0.3'
      category: 'Security Center'
    }
    policyRule: {
      if: {
        field: 'type'
        in: [
          'Microsoft.ClassicCompute/virtualMachines'
          'Microsoft.Compute/virtualMachines'
        ]
      }
      then: {
        effect: 'AuditIfNotExists'
        details: {
          type: 'Microsoft.Security/assessments'
          name: 'd57a4221-a804-52ca-3dea-768284f06bb7'
          existenceCondition: {
            field: 'Microsoft.Security/assessments/status.code'
            in: [
              'NotApplicable'
              'Healthy'
            ]
          }
        }
      }
    }
  }
}
