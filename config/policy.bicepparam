using '../deployment/policy.bicep'

param managementSubscriptionId = readEnvironmentVariable('MANAGEMENT_SUBSCRIPTION_ID')
param managementGroupId = readEnvironmentVariable('ROOT_PARENT_MANAGEMENT_GROUP_ID')
param location = 'canadaeast'
param managementRgName = 'rg-mgmt-shared-ce-01'
param workspaceName = 'log-mgmt-shared-ce-01'
param vmInsightsDcrName = 'dcr-vm-insights-shared-ce-01'
param changeTrackingDcrName = 'dcr-change-tracking-shared-ce-01'

param builtIn = [
  {
    initiativeId: '/providers/Microsoft.Authorization/policySetDefinitions/179d1daa-458f-4e47-8086-2a68d0d6c38f'
    assignmentName: 'nist-r5'
    assignmentDisplayName: 'NIST SP 800-53 Rev 5'
    roleAssignmentId: '/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c'
    parameters: any({})
  }
  {
    initiativeId: '/providers/Microsoft.Authorization/policySetDefinitions/1f3afdf9-d0c9-4c3d-847f-89da613e70a8'
    assignmentName: 'mcsb'
    assignmentDisplayName: 'Microsoft Cloud Security Benchmark'
    roleAssignmentId: '/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c'
    parameters: any({})
  }
  {
    initiativeId: '/providers/Microsoft.Authorization/policySetDefinitions/fe7782e4-6ff3-4e39-8d8a-64b6f7b82c85'
    assignmentName: 'cis-v210'
    assignmentDisplayName: 'CIS Azure Foundations v2.1.0'
    roleAssignmentId: '/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c'
    parameters: any({
      'operationName-c5447c04-a4d7-4ba8-a263-c9ee321a6858': {
        value: 'Microsoft.Authorization/policyAssignments/delete'
      }
      'operationName-b954148f-4c11-4c38-8221-be76711e194a': {
        value: 'Microsoft.Sql/servers/firewallRules/write'
      }
    })
  }
]

param auditLogs = {
  initiativeId: '/providers/Microsoft.Authorization/policySetDefinitions/0884adba-2312-4468-abeb-5422caed1038'
  assignmentName: 'all-audit-category-logs'
  assignmentDisplayName: 'Enable All Logs Category Diagnostics Settings for All Supported Resources'
  roleAssignmentId: '/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c'
}

param changeTracking = {
  initiativeId: '/providers/Microsoft.Authorization/policySetDefinitions/92a36f05-ebc9-4bba-9128-b47ad2ea3354'
  assignmentName: 'change-tracking-vm'
  assignmentDisplayName: 'Enable Change Tracking and Inventory for Virtual Machine'
  roleAssignmentId: '/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c'
}

param vmInsights = {
  initiativeId: '/providers/Microsoft.Authorization/policySetDefinitions/924bfe3a-762f-40e7-86dd-5c8b95eb09e6'
  assignmentName: 'insights-vm'
  assignmentDisplayName: 'Enable Insights for Virtual Machine'
  roleAssignmentId: '/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c'
}

param sqlDefender = {
  initiativeId: '/providers/Microsoft.Authorization/policySetDefinitions/d7c3ea3a-edf3-4bd5-bd64-d5b635b05393'
  assignmentName: 'sql-defender'
  assignmentDisplayName: 'Enable SQL Defender for SQL VM and SQL Server'
  roleAssignmentId: '/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c'
}

param vmMde = {
  initiativeId: '/providers/Microsoft.Authorization/policySetDefinitions/e20d08c5-6d64-656d-6465-ce9e37fd0ebc'
  assignmentName: 'vm-mde'
  assignmentDisplayName: 'Enable Microsoft Defender for Endpoint for Virtual Machines'
  roleAssignmentId: '/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c'
}

param iaasAntiMalware = {
  initiativeId: '/providers/Microsoft.Authorization/policyDefinitions/9b597639-28e4-48eb-b506-56b05d366257'
  assignmentName: 'vm-antimalware'
  assignmentDisplayName: 'Enable IAAS Anti Malware for Virtual Machines'
  roleAssignmentId: '/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c'
}

param guestConfiguration = {
  initiativeId: '/providers/Microsoft.Authorization/policySetDefinitions/12794019-7a00-42cf-95c2-882eed337cc8'
  assignmentName: 'vm-guest'
  assignmentDisplayName: 'Enable Virtual Machine Guest Configuration'
  roleAssignmentId: '/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c'
}

param dependencyAgentInitiative = {
  name: 'vm-dependency-agent'
  displayName: 'Dependency Agents for Virtual Machines'
  defList: [
    {
      parameters: any({})
      policyDefinitionId: '/providers/Microsoft.Authorization/policyDefinitions/4da21710-ce6f-4e06-8cdb-5cc4c93ffbee'
    }
    {
      parameters: any({})
      policyDefinitionId: '/providers/Microsoft.Authorization/policyDefinitions/1c210e94-a481-4beb-95fa-1571b434fb04'
    }
  ]
}

param dependencyAgent = {
  assignmentName: 'vm-dependency-agent'
  assignmentDisplayName: 'Enable Virtual Machine Dependency Agent'
  roleAssignmentId: '/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c'
}

param generalPolicyInitiative = {
  name: 'gen-set'
  displayName: 'General Governance'
  defList: [
    {
      parameters: any({
        listOfAllowedLocations: {
          value: [
            'canadaeast'
            'canadacentral'
          ]
        }
      })
      policyDefinitionId: '/providers/Microsoft.Authorization/policyDefinitions/e56962a6-4747-49cd-b67b-bf8b01975c4c'
    }
    {
      parameters: any({})
      policyDefinitionId: '/providers/Microsoft.Authorization/policyDefinitions/0a914e76-4921-4c19-b460-a2d36003525a'
    }
  ]
}

param general = {
  assignmentName: 'general-governance'
  assignmentDisplayName: 'General Governance for Resource Location'
  roleAssignmentId: '/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c'
}

param computePolicyInitiative = {
  name: 'comp-set'
  displayName: 'Compute Governance'
  defList: [
    {
      parameters: any({
        listOfAllowedSKUs: {
          value: [
            'Standard_B12ms'
            'Standard_B16ms'
            'Standard_B1ms'
            'Standard_B1s'
            'Standard_B2ms'
            'Standard_B2s'
            'Standard_B8as_v2'
            'Standard_B8ms'
            'Standard_D16as_v4'
            'Standard_D16ds_v5'
            'Standard_D16lds_v5'
            'Standard_D2ads_v5'
            'Standard_D2as_v4'
            'Standard_D2as_v5'
            'Standard_D2s_v3'
            'Standard_D32as_v4'
            'Standard_D32ds_v5'
            'Standard_D48ads_v5'
            'Standard_D4as_v4'
            'Standard_D4as_v5'
            'Standard_D4ds_v5'
            'Standard_D4lds_v5'
            'Standard_D4ls_v5'
            'Standard_D4s_v3'
            'Standard_D4s_v4'
            'Standard_D8a_v4'
            'Standard_D8as_v4'
            'Standard_D8lds_v5'
            'Standard_D8s_v3'
            'Standard_DC2s_v2'
            'Standard_DS1_v2'
            'Standard_DS11_v2'
            'Standard_DS12_v2'
            'Standard_DS13_v2'
            'Standard_DS2_v2'
            'Standard_DS3_v2'
            'Standard_E16ads_v5'
            'Standard_E32s_v3'
            'Standard_E4s_v3'
            'Standard_E8-4s_v3'
            'Standard_E8s_v3'
            'Standard_F2s_v2'
            'Standard_F4s_v2'
          ]
        }
      })
      policyDefinitionId: '/providers/Microsoft.Authorization/policyDefinitions/cccc23c7-8427-4f53-ad12-b6a63eb452b3'
    }
    {
      parameters: any({
        approvedExtensions: {
          value: [
            'AzureMonitorWindowsAgent'
            'AzureMonitorLinuxAgent'
            'AzurePolicyforWindows'
            'AzurePolicyforLinux'
            'ChangeTracking-Windows'
            'ChangeTracking-Linux'
            'DependencyAgentLinux'
            'DependencyAgentWindows'
            'IaaSAntimalware'
            'MDE.Windows'
            'MDE.Linux'
          ]
        }
      })
      policyDefinitionId: '/providers/Microsoft.Authorization/policyDefinitions/c0e996f8-39cf-4af9-9f45-83fbde810432'
    }
    {
      parameters: any({})
      policyDefinitionId: '/providers/Microsoft.Authorization/policyDefinitions/06a78e20-9358-41c9-923c-fb736d382a4d'
    }
  ]
}

param compute = {
  assignmentName: 'compute-governance'
  assignmentDisplayName: 'Compute Governance'
  roleAssignmentId: '/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c'
}

param storagePolicyInitiative = {
  name: 'stor-set'
  displayName: 'Storage Account Governance'
  defList: [
    {
      parameters: any({})
      policyDefinitionId: '/providers/Microsoft.Authorization/policyDefinitions/404c3081-a854-4457-ae30-26a93ef643f9'
    }
    {
      parameters: any({})
      policyDefinitionId: '/providers/Microsoft.Authorization/policyDefinitions/b2982f36-99f2-4db5-8eff-283140c09693'
    }
    {
      parameters: any({})
      policyDefinitionId: '/providers/Microsoft.Authorization/policyDefinitions/044985bb-afe1-42cd-8a36-9d5d42424537'
    }
    {
      parameters: any({})
      policyDefinitionId: '/providers/Microsoft.Authorization/policyDefinitions/fe83a0eb-a853-422d-aac2-1bffd182c5d0'
    }
    {
      parameters: any({
        listOfAllowedSKUs: {
          value: [
            'Standard_LRS'
            'Standard_GRS'
            'Standard_LRS'
            'Standard_RAGRS'
            'Standard_ZRS'
          ]
        }
      })
      policyDefinitionId: '/providers/Microsoft.Authorization/policyDefinitions/7433c107-6db4-4ad1-b57a-a76dce0154a1'
    }
  ]
}

param storage = {
  assignmentName: 'storage-governance'
  assignmentDisplayName: 'Storage Account Governance'
  roleAssignmentId: '/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c'
}

param mySqlPolicyInitiative = {
  name: 'mysql-set'
  displayName: 'MySQL Governance'
  defList: [
    {
      parameters: any({})
      policyDefinitionId: '/providers/Microsoft.Authorization/policyDefinitions/40e85574-ef33-47e8-a854-7a65c7500560'
    }
    {
      parameters: any({})
      policyDefinitionId: '/providers/Microsoft.Authorization/policyDefinitions/146412e9-005c-472b-9e48-c87b72ac229e'
    }
    {
      parameters: any({})
      policyDefinitionId: '/providers/Microsoft.Authorization/policyDefinitions/82339799-d096-41ae-8538-b108becf0970'
    }
    {
      parameters: any({})
      policyDefinitionId: '/providers/Microsoft.Authorization/policyDefinitions/d9844e8a-1437-4aeb-a32c-0c992f056095'
    }
    {
      parameters: any({})
      policyDefinitionId: '/providers/Microsoft.Authorization/policyDefinitions/c9299215-ae47-4f50-9c54-8a392f68a052'
    }
    {
      parameters: any({})
      policyDefinitionId: '/providers/Microsoft.Authorization/policyDefinitions/83cef61d-dbd1-4b20-a4fc-5fbc7da10833'
    }
    {
      parameters: any({})
      policyDefinitionId: '/providers/Microsoft.Authorization/policyDefinitions/e802a67a-daf5-4436-9ea6-f6d821dd0c5d'
    }
  ]
}

param mysql = {
  assignmentName: 'mysql-governance'
  assignmentDisplayName: 'MySQL Database Governance'
  roleAssignmentId: '/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c'
}

param psqlPolicyInitiative = {
  name: 'psql-set'
  displayName: 'PostgreSQL Governance'
  defList: [
    {
      parameters: any({})
      policyDefinitionId: '/providers/Microsoft.Authorization/policyDefinitions/fa498b91-8a7e-4710-9578-da944c68d1fe'
    }
    {
      parameters: any({})
      policyDefinitionId: '/providers/Microsoft.Authorization/policyDefinitions/4eb5e667-e871-4292-9c5d-8bbb94e0c908'
    }
    {
      parameters: any({})
      policyDefinitionId: '/providers/Microsoft.Authorization/policyDefinitions/d158790f-bfb0-486c-8631-2dc6b4e8e6af'
    }
    {
      parameters: any({})
      policyDefinitionId: '/providers/Microsoft.Authorization/policyDefinitions/c29c38cb-74a7-4505-9a06-e588ab86620a'
    }
    {
      parameters: any({})
      policyDefinitionId: '/providers/Microsoft.Authorization/policyDefinitions/48af4db5-9b8b-401c-8e74-076be876a430'
    }
    {
      parameters: any({})
      policyDefinitionId: '/providers/Microsoft.Authorization/policyDefinitions/cee2f9fd-3968-44be-a863-bd62c9884423'
    }
    {
      parameters: any({})
      policyDefinitionId: '/providers/Microsoft.Authorization/policyDefinitions/a43d5475-c569-45ce-a268-28fa79f4e87a'
    }
    {
      parameters: any({})
      policyDefinitionId: '/providers/Microsoft.Authorization/policyDefinitions/12c74c95-0efd-48da-b8d9-2a7d68470c92'
    }
    {
      parameters: any({})
      policyDefinitionId: '/providers/Microsoft.Authorization/policyDefinitions/18adea5e-f416-4d0f-8aa8-d24321e3e274'
    }
    {
      parameters: any({})
      policyDefinitionId: '/providers/Microsoft.Authorization/policyDefinitions/5e1de0e3-42cb-4ebc-a86d-61d0c619ca48'
    }
    {
      parameters: any({})
      policyDefinitionId: '/providers/Microsoft.Authorization/policyDefinitions/b52376f7-9612-48a1-81cd-1ffe4b61032c'
    }
  ]
}

param psql = {
  assignmentName: 'psql-governance'
  assignmentDisplayName: 'PostgreSQL Database Governance'
  roleAssignmentId: '/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c'
}

param sqlPolicyInitiative = {
  name: 'sql-set'
  displayName: 'SQL Governance'
  defList: [
    {
      parameters: any({})
      policyDefinitionId: '/providers/Microsoft.Authorization/policyDefinitions/a6fb4358-5bf4-4ad7-ba82-2cd2f41ce5e9'
    }
    {
      parameters: any({})
      policyDefinitionId: '/providers/Microsoft.Authorization/policyDefinitions/abfb4388-5bf4-4ad7-ba82-2cd2f41ceae9'
    }
    {
      parameters: any({})
      policyDefinitionId: '/providers/Microsoft.Authorization/policyDefinitions/abfb7388-5bf4-4ad7-ba99-2cd2f41cebb9'
    }
    {
      parameters: any({})
      policyDefinitionId: '/providers/Microsoft.Authorization/policyDefinitions/32e6bbec-16b6-44c2-be37-c5b672d103cf'
    }
    {
      parameters: any({})
      policyDefinitionId: '/providers/Microsoft.Authorization/policyDefinitions/b3a22bc9-66de-45fb-98fa-00f5df42f41a'
    }
    {
      parameters: any({})
      policyDefinitionId: '/providers/Microsoft.Authorization/policyDefinitions/0c28c3fb-c244-42d5-a9bf-f35f2999577b'
    }
    {
      parameters: any({})
      policyDefinitionId: '/providers/Microsoft.Authorization/policyDefinitions/9dfea752-dd46-4766-aed1-c355fa93fb91'
    }
    {
      parameters: any({})
      policyDefinitionId: '/providers/Microsoft.Authorization/policyDefinitions/1b8ca024-1d5c-4dec-8995-b1a932b41780'
    }
    {
      parameters: any({})
      policyDefinitionId: '/providers/Microsoft.Authorization/policyDefinitions/a8793640-60f7-487c-b5c3-1d37215905c4'
    }
    {
      parameters: any({})
      policyDefinitionId: '/providers/Microsoft.Authorization/policyDefinitions/ac01ad65-10e5-46df-bdd9-6b0cad13e1d2'
    }
    {
      parameters: any({})
      policyDefinitionId: '/providers/Microsoft.Authorization/policyDefinitions/0a370ff3-6cab-4e85-8995-295fd854c5b8'
    }
    {
      parameters: any({})
      policyDefinitionId: '/providers/Microsoft.Authorization/policyDefinitions/17k78e20-9358-41c9-923c-fb736d382a12'
    }
    {
      parameters: any({})
      policyDefinitionId: '/providers/Microsoft.Authorization/policyDefinitions/1b7aa243-30e4-4c9e-bca8-d0d3022b634a'
    }
    {
      parameters: any({})
      policyDefinitionId: '/providers/Microsoft.Authorization/policyDefinitions/ef2a8f2a-b3d9-49cd-a8a8-9a3aaaf647d9'
    }
  ]
}

param sql = {
  assignmentName: 'sql-governance'
  assignmentDisplayName: 'SQL Database Governance'
  roleAssignmentId: '/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c'
}

param networkPolicyInitiative = {
  name: 'network-set'
  displayName: 'Network Governance'
  defList: [
    {
      parameters: any({})
      policyDefinitionId: '/providers/Microsoft.Authorization/policyDefinitions/c251913d-7d24-4958-af87-478ed3b9ba41'
    }
    {
      parameters: any({})
      policyDefinitionId: '/providers/Microsoft.Authorization/policyDefinitions/4c3c6c5f-0d47-4402-99b8-aa543dd8bcee'
    }
    {
      parameters: any({})
      policyDefinitionId: '/providers/Microsoft.Authorization/policyDefinitions/e71308d3-144b-4262-b144-efdc3cc90517'
    }
    {
      parameters: any({})
      policyDefinitionId: '/providers/Microsoft.Authorization/policyDefinitions/f6de0be7-9a8a-4b8a-b349-43cf02d22f7c'
    }
    {
      parameters: any({})
      policyDefinitionId: '/providers/Microsoft.Authorization/policyDefinitions/bb91dfba-c30d-4263-9add-9c2384e659a6'
    }
    {
      parameters: any({})
      policyDefinitionId: '/providers/Microsoft.Authorization/policyDefinitions/9daedab3-fb2d-461e-b861-71790eead4f6'
    }
    {
      parameters: any({})
      policyDefinitionId: '/providers/Microsoft.Authorization/policyDefinitions/fc5e4038-4584-4632-8c85-c0448d374b2c'
    }
    {
      parameters: any({})
      policyDefinitionId: '/providers/Microsoft.Authorization/policyDefinitions/564feb30-bf6a-4854-b4bb-0d2d2d1e6c66'
    }
    
  ]
}

param network = {
  assignmentName: 'network-governance'
  assignmentDisplayName: 'Network Governance'
  roleAssignmentId: '/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c'
}

param requiredTags = [
  'Department'
  'Environment'
  'Owner'
  'Project'
]

param optionalTags = [
  'CreatedBy'
  'Application'
]

param tag = {
  assignmentName: 'tag-governance'
  assignmentDisplayName: 'Tag Governance'
  roleAssignmentId: '/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c'
}
