targetScope = 'subscription'
param policyData object

module allowedResourceTypeModule './policies/allowed_resource_type.bicep' = {
  name: '${policyData.client}-${policyData.allowed_resource_type_policy.name}'
  params: {
    client: policyData.client
    policyInputData: policyData.allowed_resource_type_policy
  }
}

module allowedRegionsModule './policies/allowed_regions.bicep' = {
  name: '${policyData.client}-${policyData.allowed_regions_policy.name}'
  params: {
    client: policyData.client
    policyInputData: policyData.allowed_regions_policy
  }
}

module allowedStorageAccountSKUsModule './policies/allowed_storage_account_SKUs.bicep' = {
  name: '${policyData.client}-${policyData.allowed_storage_account_SKUs_policy.name}'
  params: {
    client: policyData.client
    policyInputData: policyData.allowed_storage_account_SKUs_policy
  }
}

module allowedSQLVersionModule './policies/allowed_sql_version.bicep' = {
  name: '${policyData.client}-${policyData.allowed_sql_version_policy.name}'
  params: {
    client: policyData.client
    policyInputData: policyData.allowed_sql_version_policy
  }
}

module allowedVMSSKUModule './policies/allowed_vms_sku.bicep' = {
  name: '${policyData.client}-${policyData.allowed_vms_sku_policy.name}'
  params: {
    client: policyData.client
    policyInputData: policyData.allowed_vms_sku_policy
  }
}

module allowedSubnetsforPublicIPModule './policies/allowed_subnets_for_public_ip.bicep' = {
  name: '${policyData.client}-${policyData.allowed_subnets_for_public_ip_policy.name}'
  params: {
    client: policyData.client
    policyInputData: policyData.allowed_subnets_for_public_ip_policy
  }
}

module allowedVMExtensionsModule './policies/allowed_vm_extensions.bicep' = {
  name: '${policyData.client}-${policyData.allowed_vm_extensions_policy.name}'
  params: {
    client: policyData.client
    policyInputData: policyData.allowed_vm_extensions_policy
  }
}

module allowedVMSOSVersionModule './policies/allowed_vms_os_version.bicep' = {
  name: '${policyData.client}-${policyData.allowed_vms_os_version_policy.name}'
  params: {
    client: policyData.client
    policyInputData: policyData.allowed_vms_os_version_policy
  }
}

module diagnosticSettingModule './policies/diagnostic_setting.bicep' = {
  name: '${policyData.client}-${policyData.diagnostic_setting_policy.name}'
  params: {
    client: policyData.client
    policyInputData: policyData.diagnostic_setting_policy
  }
}

module diagnosticsLogsSendstoLogAnalyticsWorkspaceModule './policies/diagnostics_logs_sends_to_log_analytics_workspace.bicep' = {
  name: '${policyData.client}-${policyData.diagnostics_logs_sends_to_log_analytics_workspace_policy.name}'
  params: {
    client: policyData.client
    policyInputData: policyData.diagnostics_logs_sends_to_log_analytics_workspace_policy
  }
}

module tagsMandatoryModule './policies/tags_mandatory.bicep' = {
  name: '${policyData.client}-${policyData.tags_mandatory_policy.name}'
  params: {
    client: policyData.client
    policyInputData: policyData.tags_mandatory_policy
  }
}

module nsgEverySubnetModule './policies/nsg_every_subnet.bicep' = {
  name: '${policyData.client}-${policyData.nsg_every_subnet_policy.name}'
  params: {
    client: policyData.client
    policyInputData: policyData.nsg_every_subnet_policy
  }
}

module nsgInboundRulesModule './policies/nsg_inbound_rules.bicep' = {
  name: '${policyData.client}-${policyData.nsg_inbound_rules_policy.name}'
  params: {
    client: policyData.client
    policyInputData: policyData.nsg_inbound_rules_policy
  }
}

module sslStorageSecureTransferSettingModule './policies/ssl_storage_secure_transfer_setting.bicep' = {
  name: '${policyData.client}-${policyData.ssl_storage_secure_transfer_setting_policy.name}'
  params: {
    client: policyData.client
    policyInputData: policyData.ssl_storage_secure_transfer_setting_policy
  }
}

module networkWatcherEnableModule './policies/network_watcher_enable.bicep' = {
  name: '${policyData.client}-${policyData.network_watcher_enable_policy.name}'
  params: {
    client: policyData.client
    policyInputData: policyData.network_watcher_enable_policy
  }
}

module firewallInternetTrafficModule './policies/firewall_internet_traffic.bicep' = {
  name: '${policyData.client}-${policyData.firewall_internet_traffic_policy.name}'
  params: {
    client: policyData.client
    policyInputData: policyData.firewall_internet_traffic_policy
  }
}

module ddosProtectionModule './policies/ddos_protection.bicep' = {
  name: '${policyData.client}-${policyData.ddos_protection_policy.name}'
  params: {
    client: policyData.client
    policyInputData: policyData.ddos_protection_policy
  }
}

module networkInterfaceIPForwardingModule './policies/network_interface_ip_forwarding.bicep' = {
  name: '${policyData.client}-${policyData.network_interface_ip_forwarding_policy.name}'
  params: {
    client: policyData.client
    policyInputData: policyData.network_interface_ip_forwarding_policy
  }
}

module VMManagementPortModule './policies/vm_management_port.bicep' = {
  name: '${policyData.client}-${policyData.vm_management_port_policy.name}'
  params: {
    client: policyData.client
    policyInputData: policyData.vm_management_port_policy
  }
}

module VMManagementDiskModule './policies/vm_managed_disk.bicep' = {
  name: '${policyData.client}-${policyData.vm_managed_disk_policy.name}'
  params: {
    client: policyData.client
    policyInputData: policyData.vm_managed_disk_policy
  }
}

module VMInternetFacingNSGModule './policies/vm_internet_facing_nsg.bicep' = {
  name: '${policyData.client}-${policyData.vm_internet_facing_nsg_policy.name}'
  params: {
    client: policyData.client
    policyInputData: policyData.vm_internet_facing_nsg_policy
  }
}

module VMEncryptionModule './policies/vm_encryption.bicep' = {
  name: '${policyData.client}-${policyData.vm_encryption_policy.name}'
  params: {
    client: policyData.client
    policyInputData: policyData.vm_encryption_policy
  }
}

module tagsOptionalModule './policies/tags_optional.bicep' = {
  name: '${policyData.client}-${policyData.tags_optional_policy.name}'
  params: {
    client: policyData.client
    policyInputData: policyData.tags_optional_policy
  }
}

module storageAccountNetworkAccessModule './policies/storage_account_network_access.bicep' = {
  name: '${policyData.client}-${policyData.storage_account_network_access_policy.name}'
  params: {
    client: policyData.client
    policyInputData: policyData.storage_account_network_access_policy
  }
}

module storageAccountKeyExpiryModule './policies/storage_account_key_expiry.bicep' = {
  name: '${policyData.client}-${policyData.storage_account_key_expiry_policy.name}'
  params: {
    client: policyData.client
    policyInputData: policyData.storage_account_key_expiry_policy
  }
}

module sqlServerNetworkAccessModule './policies/sql_server_network_access.bicep' = {
  name: '${policyData.client}-${policyData.sql_server_network_access_policy.name}'
  params: {
    client: policyData.client
    policyInputData: policyData.sql_server_network_access_policy
  }
}

module sqlDatabaseTLSVersionModule './policies/sql_database_tls_version.bicep' = {
  name: '${policyData.client}-${policyData.sql_database_tls_version_policy.name}'
  params: {
    client: policyData.client
    policyInputData: policyData.sql_database_tls_version_policy
  }
}

module sqlDatabasePrivateEndpointModule './policies/sql_database_private_endpoint.bicep' = {
  name: '${policyData.client}-${policyData.sql_database_private_endpoint_policy.name}'
  params: {
    client: policyData.client
    policyInputData: policyData.sql_database_private_endpoint_policy
  }
}

module keysVaultSoftDeleteModule './policies/keys_vault_soft_delete.bicep' = {
  name: '${policyData.client}-${policyData.keys_vault_soft_delete_policy.name}'
  params: {
    client: policyData.client
    policyInputData: policyData.keys_vault_soft_delete_policy
  }
}

module keysVaultPurgeProtectionModule './policies/keys_vault_purge_protection.bicep' = {
  name: '${policyData.client}-${policyData.keys_vault_purge_protection_policy.name}'
  params: {
    client: policyData.client
    policyInputData: policyData.keys_vault_purge_protection_policy
  }
}

resource policyDefSet 'Microsoft.Authorization/policySetDefinitions@2021-06-01' = {
  name: '${policyData.client}-${policyData.name}'
  dependsOn: [
    allowedResourceTypeModule
    allowedRegionsModule
    allowedStorageAccountSKUsModule
    allowedSQLVersionModule
    allowedVMSSKUModule
    allowedSubnetsforPublicIPModule
    allowedVMExtensionsModule
    allowedVMSOSVersionModule
    diagnosticSettingModule
    diagnosticsLogsSendstoLogAnalyticsWorkspaceModule
    tagsMandatoryModule
    nsgEverySubnetModule
    nsgInboundRulesModule
    sslStorageSecureTransferSettingModule
    networkWatcherEnableModule
    firewallInternetTrafficModule
    ddosProtectionModule
    networkInterfaceIPForwardingModule
    VMManagementPortModule
    VMManagementDiskModule
    VMInternetFacingNSGModule
    VMEncryptionModule
    tagsOptionalModule
    storageAccountNetworkAccessModule
    storageAccountKeyExpiryModule
    sqlServerNetworkAccessModule
    sqlDatabaseTLSVersionModule
    sqlDatabasePrivateEndpointModule
    keysVaultSoftDeleteModule
    keysVaultPurgeProtectionModule
  ]
  properties: {
    policyType: policyData.policyType
    displayName: policyData.policySetDefinitionDisplayName
    parameters: {}
    policyDefinitions: [
      {
        //#2:allowed_resource_type_policy
        policyDefinitionId: allowedResourceTypeModule.outputs.policyId
        parameters: {}
      }
      {
        //#3:allowed_regions_policy
        policyDefinitionId: allowedRegionsModule.outputs.policyId
        parameters: {}
      }
      {
        //#4:allowed_sql_version_policy
        policyDefinitionId: allowedSQLVersionModule.outputs.policyId
        parameters: {}
      }
      {
        //#5:allowed_vms_sku_policy
        policyDefinitionId: allowedVMSSKUModule.outputs.policyId
        parameters: {}
      }
      {
        //#6:allowed_subnets_for_public_ip_policy
        policyDefinitionId: allowedSubnetsforPublicIPModule.outputs.policyId
        parameters: {}
      }
      {
        //#7:allowed_vm_extensions_policy
        policyDefinitionId: allowedVMExtensionsModule.outputs.policyId
        parameters: {}
      }
      {
        //#8:allowed_vms_os_version_policy
        policyDefinitionId: allowedVMSOSVersionModule.outputs.policyId
        parameters: {}
      }
      {
        //#9:diagnostic_setting_policy
        policyDefinitionId: diagnosticSettingModule.outputs.policyId
        parameters: {}
      }
      {
        //#10:diagnostics_logs_sends_to_log_analytics_workspace_policy
        policyDefinitionId: diagnosticsLogsSendstoLogAnalyticsWorkspaceModule.outputs.policyId
        parameters: {}
      }
      {
        //#11:tags_mandatory_policy
        policyDefinitionId: tagsMandatoryModule.outputs.policyId
        parameters: {}
      }
      {
        //#12:nsg_every_subnet_policy
        policyDefinitionId: nsgEverySubnetModule.outputs.policyId
        parameters: {}
      }

      {
        //#13:nsg_inbound_rules_policy
        policyDefinitionId: nsgInboundRulesModule.outputs.policyId
        parameters: {}
      }

      {
        //#14:ssl_storage_secure_transfer_setting_policy
        policyDefinitionId: sslStorageSecureTransferSettingModule.outputs.policyId
        parameters: {}
      }

      {
        //#15:network_watcher_enable_policy
        policyDefinitionId: networkWatcherEnableModule.outputs.policyId
        parameters: {}
      }
      {
        //#16:allowed_storage_account_SKUs_policy
        policyDefinitionId: allowedStorageAccountSKUsModule.outputs.policyId
        parameters: {}
      }
      {
        //#17:firewall_internet_traffic
        policyDefinitionId: firewallInternetTrafficModule.outputs.policyId
        parameters: {}
      }
      {
        //#18:ddos_protection_policy
        policyDefinitionId: ddosProtectionModule.outputs.policyId
        parameters: {}
      }
      {
        //#19:network_interface_ip_forwarding_policy
        policyDefinitionId: networkInterfaceIPForwardingModule.outputs.policyId
        parameters: {}
      }
      {
        //#20:vm_management_port_policy
        policyDefinitionId: VMManagementPortModule.outputs.policyId
        parameters: {}
      }
      {
        //#21:vm_managed_disk_policy
        policyDefinitionId: VMManagementDiskModule.outputs.policyId
        parameters: {}
      }
      {
        //#22:vm_internet_facing_nsg_policy
        policyDefinitionId: VMInternetFacingNSGModule.outputs.policyId
        parameters: {}
      }
      {
        //#23:vm_encryption_policy
        policyDefinitionId: VMEncryptionModule.outputs.policyId
        parameters: {}
      }
      {
        //#24:tags_optional_policy
        policyDefinitionId: tagsOptionalModule.outputs.policyId
        parameters: {}
      }
      {
        //#25:storage_account_network_access_policy
        policyDefinitionId: storageAccountNetworkAccessModule.outputs.policyId
        parameters: {}
      }
      {
        //#26:storage_account_key_expiry_policy
        policyDefinitionId: storageAccountKeyExpiryModule.outputs.policyId
        parameters: {}
      }
      {
        //#27:sql_server_network_access_policy
        policyDefinitionId: sqlServerNetworkAccessModule.outputs.policyId
        parameters: {}
      }
      {
        //#28:sql_database_tls_version_policy
        policyDefinitionId: sqlDatabaseTLSVersionModule.outputs.policyId
        parameters: {}
      }
      {
        //#29:sql_database_private_endpoint_policy
        policyDefinitionId: sqlDatabasePrivateEndpointModule.outputs.policyId
        parameters: {}
      }
      {
        //#30:keys_vault_soft_delete_policy
        policyDefinitionId: keysVaultSoftDeleteModule.outputs.policyId
        parameters: {}
      }
      {
        //#31:keys_vault_purge_protection_policy
        policyDefinitionId: keysVaultPurgeProtectionModule.outputs.policyId
        parameters: {}
      }
    ]
  }
}

resource policyAssign 'Microsoft.Authorization/policyAssignments@2021-06-01' = {
  name: '${policyData.client}-${policyData.name}-Assignment'
  properties: {
    displayName: '${policyData.client}-${policyData.policyInitiativeDisplayName}'
    enforcementMode: 'Default'
    policyDefinitionId: policyDefSet.id
    parameters: {}
  }
}
