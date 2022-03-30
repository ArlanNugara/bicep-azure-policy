targetScope = 'subscription'

param policyInputData object
param client string
output policyId string = vm_managed_disk_policy.id

resource vm_managed_disk_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-${policyInputData.name}'
  properties: {
    displayName: '${client}-${policyInputData.displayName}'
    policyType: 'Custom'
    mode: 'All'
    description: policyInputData.description
    metadata: {
      category: 'Compute'
    }
    parameters: {
      policyEffect: {
        type: 'String'
        metadata: {
          description: 'Policy Effect'
          displayName: 'The effect determines what happens when the policy rule is evaluated to match'
        }
        defaultValue: policyInputData.effect
      }
    }
    policyRule: {
      if: {
        anyOf: [
          {
            allOf: [
              {
                field: 'type'
                equals: 'Microsoft.Compute/virtualMachines'
              }
              {
                field: 'Microsoft.Compute/virtualMachines/osDisk.uri'
                exists: true
              }
            ]
          }
          {
            allOf: [
              {
                field: 'type'
                equals: 'Microsoft.Compute/VirtualMachineScaleSets'
              }
              {
                anyOf: [
                  {
                    field: 'Microsoft.Compute/VirtualMachineScaleSets/osDisk.vhdContainers'
                    exists: true
                  }
                  {
                    field: 'Microsoft.Compute/VirtualMachineScaleSets/osdisk.imageUrl'
                    exists: true
                  }
                ]
              }
            ]
          }
        ]
      }
      then: {
        effect: '[parameters(\'policyEffect\')]'
      }
    }
  }
}
