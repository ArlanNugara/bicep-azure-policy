targetScope = 'subscription'
param policyData object

module br1_azure_backup_should_be_enabled_for_virtual_machines_policy './policies/br1_azure_backup_should_be_enabled_for_virtual_machines_policy.bicep' = {
  name: '${policyData.client}-Azure Backup should be enabled for Virtual Machines'
  params: {
    client: policyData.client
  }
}

module br1_geo_redundant_backup_should_be_enabled_for_azure_database_for_postgresql_policy './policies/br1_geo_redundant_backup_should_be_enabled_for_azure_database_for_postgresql_policy.bicep' = {
  name: '${policyData.client}-Geo-redundant backup should be enabled for Azure Database for PostgreSQL'
  params: {
    client: policyData.client
  }
}

module br1_geo_redundant_backup_should_be_enabled_for_azure_database_for_mysql_policy './policies/br1_geo_redundant_backup_should_be_enabled_for_azure_database_for_mysql_policy.bicep' = {
  name: '${policyData.client}-Geo-redundant backup should be enabled for Azure Database for MySQL'
  params: {
    client: policyData.client
  }
}

module br1_geo_redundant_backup_should_be_enabled_for_azure_database_for_mariadb_policy './policies/br1_geo_redundant_backup_should_be_enabled_for_azure_database_for_mariadb_policy.bicep' = {
  name: '${policyData.client}-Geo-redundant backup should be enabled for Azure Database for MariaDB'
  params: {
    client: policyData.client
  }
}

module br2_azure_backup_should_be_enabled_for_virtual_machines_policy './policies/br2_azure_backup_should_be_enabled_for_virtual_machines_policy.bicep' = {
  name: '${policyData.client}-Azure Backup should be enabled for Virtual Machines'
  params: {
    client: policyData.client
  }
}

module br2_geo_redundant_backup_should_be_enabled_for_azure_database_for_postgresql_policy './policies/br2_geo_redundant_backup_should_be_enabled_for_azure_database_for_postgresql_policy.bicep' = {
  name: '${policyData.client}-Geo-redundant backup should be enabled for Azure Database for PostgreSQL'
  params: {
    client: policyData.client
  }
}

module br2_geo_redundant_backup_should_be_enabled_for_azure_database_for_mysql_policy './policies/br2_geo_redundant_backup_should_be_enabled_for_azure_database_for_mysql_policy.bicep' = {
  name: '${policyData.client}-Geo-redundant backup should be enabled for Azure Database for MySQL'
  params: {
    client: policyData.client
  }
}

module br2_geo_redundant_backup_should_be_enabled_for_azure_database_for_mariadb_policy './policies/br2_geo_redundant_backup_should_be_enabled_for_azure_database_for_mariadb_policy.bicep' = {
  name: '${policyData.client}-Geo-redundant backup should be enabled for Azure Database for MariaDB'
  params: {
    client: policyData.client
  }
}

module es1_azure_defender_for_servers_should_be_enabled_policy './policies/es1_azure_defender_for_servers_should_be_enabled_policy.bicep' = {
  name: '${policyData.client}-Azure Defender for servers should be enabled'
  params: {
    client: policyData.client
  }
}

module es2_endpoint_protection_solution_should_be_installed_on_virtual_machine_scale_sets_policy './policies/es2_endpoint_protection_solution_should_be_installed_on_virtual_machine_scale_sets_policy.bicep' = {
  name: '${policyData.client}-Endpoint protection solution should be installed on virtual machine scale sets'
  params: {
    client: policyData.client
  }
}

module es2_endpoint_protection_should_be_installed_on_your_machines_policy './policies/es2_endpoint_protection_should_be_installed_on_your_machines_policy.bicep' = {
  name: '${policyData.client}-Endpoint protection should be installed on your machines'
  params: {
    client: policyData.client
  }
}

module es2_endpoint_protection_health_issues_should_be_resolved_on_your_machines_policy './policies/es2_endpoint_protection_health_issues_should_be_resolved_on_your_machines_policy.bicep' = {
  name: '${policyData.client}-Endpoint protection health issues should be resolved on your machines'
  params: {
    client: policyData.client
  }
}

module es2_windows_defender_exploit_guard_should_be_enabled_on_your_machines_policy './policies/es2_windows_defender_exploit_guard_should_be_enabled_on_your_machines_policy.bicep' = {
  name: '${policyData.client}-Windows Defender Exploit Guard should be enabled on your machines'
  params: {
    client: policyData.client
  }
}

module es3_endpoint_protection_health_issues_should_be_resolved_on_your_machines_policy './policies/es3_endpoint_protection_health_issues_should_be_resolved_on_your_machines_policy.bicep' = {
  name: '${policyData.client}-Endpoint protection health issues should be resolved on your machines'
  params: {
    client: policyData.client
  }
}

module pv2_kubernetes_clusters_should_not_use_the_default_namespace_policy './policies/pv2_kubernetes_clusters_should_not_use_the_default_namespace_policy.bicep' = {
  name: '${policyData.client}-Kubernetes clusters should not use the default namespace'
  params: {
    client: policyData.client
  }
}

module pv2_kubernetes_cluster_pod_hostpath_volumes_should_only_use_allowed_host_paths_policy './policies/pv2_kubernetes_cluster_pod_hostpath_volumes_should_only_use_allowed_host_paths_policy.bicep' = {
  name: '${policyData.client}-Kubernetes cluster pod hostPath volumes should only use allowed host paths'
  params: {
    client: policyData.client
  }
}

module pv2_kubernetes_cluster_pods_should_only_use_approved_host_network_and_port_range_policy './policies/pv2_kubernetes_cluster_pods_should_only_use_approved_host_network_and_port_range_policy.bicep' = {
  name: '${policyData.client}-Kubernetes cluster pods should only use approved host network and port range'
  params: {
    client: policyData.client
  }
}

module pv2_cors_should_not_allow_every_resource_to_access_your_api_app_policy './policies/pv2_cors_should_not_allow_every_resource_to_access_your_api_app_policy.bicep' = {
  name: '${policyData.client}-CORS should not allow every resource to access your API App'
  params: {
    client: policyData.client
  }
}

module pv2_cors_should_not_allow_every_resource_to_access_your_web_applications_policy './policies/pv2_cors_should_not_allow_every_resource_to_access_your_web_applications_policy.bicep' = {
  name: '${policyData.client}-CORS should not allow every resource to access your Web Applications'
  params: {
    client: policyData.client
  }
}

module pv4_guest_attestation_extension_should_be_installed_on_supported_linux_virtual_machines_policy './policies/pv4_guest_attestation_extension_should_be_installed_on_supported_linux_virtual_machines_policy.bicep' = {
  name: '${policyData.client}-Guest Attestation extension should be installed on supported Linux virtual machines'
  params: {
    client: policyData.client
  }
}

module pv4_guest_attestation_extension_should_be_installed_on_supported_linux_virtual_machines_scale_sets_policy './policies/pv4_guest_attestation_extension_should_be_installed_on_supported_linux_virtual_machines_scale_sets_policy.bicep' = {
  name: '${policyData.client}-Guest Attestation extension should be installed on supported Linux virtual machines scale sets'
  params: {
    client: policyData.client
  }
}

module pv4_windows_machines_should_meet_requirements_of_the_azure_compute_security_baseline_policy './policies/pv4_windows_machines_should_meet_requirements_of_the_azure_compute_security_baseline_policy.bicep' = {
  name: '${policyData.client}-Windows machines should meet requirements of the Azure compute security baseline'
  params: {
    client: policyData.client
  }
}

module pv4_guest_attestation_extension_should_be_installed_on_supported_windows_virtual_machines_policy './policies/pv4_guest_attestation_extension_should_be_installed_on_supported_windows_virtual_machines_policy.bicep' = {
  name: '${policyData.client}-Guest Attestation extension should be installed on supported Windows virtual machines'
  params: {
    client: policyData.client
  }
}

module pv4_vtpm_should_be_enabled_on_supported_virtual_machines_policy './policies/pv4_vtpm_should_be_enabled_on_supported_virtual_machines_policy.bicep' = {
  name: '${policyData.client}-vTPM should be enabled on supported virtual machines'
  params: {
    client: policyData.client
  }
}

module pv5_vulnerability_assessment_should_be_enabled_on_sql_managed_instance_policy './policies/pv5_vulnerability_assessment_should_be_enabled_on_sql_managed_instance_policy.bicep' = {
  name: '${policyData.client}-Vulnerability assessment should be enabled on SQL Managed Instance'
  params: {
    client: policyData.client
  }
}

module pv5_vulnerability_assessment_should_be_enabled_on_your_sql_servers_policy './policies/pv5_vulnerability_assessment_should_be_enabled_on_your_sql_servers_policy.bicep' = {
  name: '${policyData.client}-Vulnerability assessment should be enabled on your SQL servers'
  params: {
    client: policyData.client
  }
}

module pv5_a_vulnerability_assessment_solution_should_be_enabled_on_your_virtual_machines_policy './policies/pv5_a_vulnerability_assessment_solution_should_be_enabled_on_your_virtual_machines_policy.bicep' = {
  name: '${policyData.client}-A vulnerability assessment solution should be enabled on your virtual machines'
  params: {
    client: policyData.client
  }
}

module pv6_sql_servers_on_machines_should_have_vulnerability_findings_resolved_policy './policies/pv6_sql_servers_on_machines_should_have_vulnerability_findings_resolved_policy.bicep' = {
  name: '${policyData.client}-SQL servers on machines should have vulnerability findings resolved'
  params: {
    client: policyData.client
  }
}

module pv6_ensure_that_java_version_is_the_latest__if_used_as_a_part_of_the_function_app_policy './policies/pv6_ensure_that_java_version_is_the_latest__if_used_as_a_part_of_the_function_app_policy.bicep' = {
  name: '${policyData.client}-Ensure that \'Java version\' is the latest, if used as a part of the Function app'
  params: {
    client: policyData.client
  }
}

module pv6_ensure_that_python_version_is_the_latest__if_used_as_a_part_of_the_web_app_policy './policies/pv6_ensure_that_python_version_is_the_latest__if_used_as_a_part_of_the_web_app_policy.bicep' = {
  name: '${policyData.client}-Ensure that \'Python version\' is the latest, if used as a part of the Web app'
  params: {
    client: policyData.client
  }
}

module pv6_container_registry_images_should_have_vulnerability_findings_resolved_policy './policies/pv6_container_registry_images_should_have_vulnerability_findings_resolved_policy.bicep' = {
  name: '${policyData.client}-Container registry images should have vulnerability findings resolved'
  params: {
    client: policyData.client
  }
}

module pv6_ensure_that_python_version_is_the_latest__if_used_as_a_part_of_the_api_app_policy './policies/pv6_ensure_that_python_version_is_the_latest__if_used_as_a_part_of_the_api_app_policy.bicep' = {
  name: '${policyData.client}-Ensure that \'Python version\' is the latest, if used as a part of the API app'
  params: {
    client: policyData.client
  }
}

module ir2_subscriptions_should_have_a_contact_email_address_for_security_issues_policy './policies/ir2_subscriptions_should_have_a_contact_email_address_for_security_issues_policy.bicep' = {
  name: '${policyData.client}-Subscriptions should have a contact email address for security issues'
  params: {
    client: policyData.client
  }
}

module ir2_email_notification_to_subscription_owner_for_high_severity_alerts_should_be_enabled_policy './policies/ir2_email_notification_to_subscription_owner_for_high_severity_alerts_should_be_enabled_policy.bicep' = {
  name: '${policyData.client}-Email notification to subscription owner for high severity alerts should be enabled'
  params: {
    client: policyData.client
  }
}

module ir2_email_notification_for_high_severity_alerts_should_be_enabled_policy './policies/ir2_email_notification_for_high_severity_alerts_should_be_enabled_policy.bicep' = {
  name: '${policyData.client}-Email notification for high severity alerts should be enabled'
  params: {
    client: policyData.client
  }
}

module ir3_azure_defender_for_sql_should_be_enabled_for_unprotected_sql_managed_instances_policy './policies/ir3_azure_defender_for_sql_should_be_enabled_for_unprotected_sql_managed_instances_policy.bicep' = {
  name: '${policyData.client}-Azure Defender for SQL should be enabled for unprotected SQL Managed Instances'
  params: {
    client: policyData.client
  }
}

module ir3_azure_defender_for_resource_manager_should_be_enabled_policy './policies/ir3_azure_defender_for_resource_manager_should_be_enabled_policy.bicep' = {
  name: '${policyData.client}-Azure Defender for Resource Manager should be enabled'
  params: {
    client: policyData.client
  }
}

module ir3_azure_defender_for_open_source_relational_databases_should_be_enabled_policy './policies/ir3_azure_defender_for_open_source_relational_databases_should_be_enabled_policy.bicep' = {
  name: '${policyData.client}-Azure Defender for open-source relational databases should be enabled'
  params: {
    client: policyData.client
  }
}

module ir3_azure_defender_for_key_vault_should_be_enabled_policy './policies/ir3_azure_defender_for_key_vault_should_be_enabled_policy.bicep' = {
  name: '${policyData.client}-Azure Defender for Key Vault should be enabled'
  params: {
    client: policyData.client
  }
}

module ir3_azure_defender_for_dns_should_be_enabled_policy './policies/ir3_azure_defender_for_dns_should_be_enabled_policy.bicep' = {
  name: '${policyData.client}-Azure Defender for DNS should be enabled'
  params: {
    client: policyData.client
  }
}

module ir4_network_watcher_should_be_enabled_policy './policies/ir4_network_watcher_should_be_enabled_policy.bicep' = {
  name: '${policyData.client}-Network Watcher should be enabled'
  params: {
    client: policyData.client
  }
}

module ir5_azure_defender_for_sql_should_be_enabled_for_unprotected_sql_managed_instances_policy './policies/ir5_azure_defender_for_sql_should_be_enabled_for_unprotected_sql_managed_instances_policy.bicep' = {
  name: '${policyData.client}-Azure Defender for SQL should be enabled for unprotected SQL Managed Instances'
  params: {
    client: policyData.client
  }
}

module ir5_azure_defender_for_resource_manager_should_be_enabled_policy './policies/ir5_azure_defender_for_resource_manager_should_be_enabled_policy.bicep' = {
  name: '${policyData.client}-Azure Defender for Resource Manager should be enabled'
  params: {
    client: policyData.client
  }
}

module ir5_azure_defender_for_open_source_relational_databases_should_be_enabled_policy './policies/ir5_azure_defender_for_open_source_relational_databases_should_be_enabled_policy.bicep' = {
  name: '${policyData.client}-Azure Defender for open-source relational databases should be enabled'
  params: {
    client: policyData.client
  }
}

module ir5_azure_defender_for_key_vault_should_be_enabled_policy './policies/ir5_azure_defender_for_key_vault_should_be_enabled_policy.bicep' = {
  name: '${policyData.client}-Azure Defender for Key Vault should be enabled'
  params: {
    client: policyData.client
  }
}

module ir5_azure_defender_for_dns_should_be_enabled_policy './policies/ir5_azure_defender_for_dns_should_be_enabled_policy.bicep' = {
  name: '${policyData.client}-Azure Defender for DNS should be enabled'
  params: {
    client: policyData.client
  }
}

module lt1_azure_defender_for_sql_should_be_enabled_for_unprotected_sql_managed_instances_policy './policies/lt1_azure_defender_for_sql_should_be_enabled_for_unprotected_sql_managed_instances_policy.bicep' = {
  name: '${policyData.client}-Azure Defender for SQL should be enabled for unprotected SQL Managed Instances'
  params: {
    client: policyData.client
  }
}

module lt1_azure_defender_for_resource_manager_should_be_enabled_policy './policies/lt1_azure_defender_for_resource_manager_should_be_enabled_policy.bicep' = {
  name: '${policyData.client}-Azure Defender for Resource Manager should be enabled'
  params: {
    client: policyData.client
  }
}

module lt1_azure_defender_for_open_source_relational_databases_should_be_enabled_policy './policies/lt1_azure_defender_for_open_source_relational_databases_should_be_enabled_policy.bicep' = {
  name: '${policyData.client}-Azure Defender for open-source relational databases should be enabled'
  params: {
    client: policyData.client
  }
}

module lt1_azure_defender_for_key_vault_should_be_enabled_policy './policies/lt1_azure_defender_for_key_vault_should_be_enabled_policy.bicep' = {
  name: '${policyData.client}-Azure Defender for Key Vault should be enabled'
  params: {
    client: policyData.client
  }
}

module lt1_azure_defender_for_dns_should_be_enabled_policy './policies/lt1_azure_defender_for_dns_should_be_enabled_policy.bicep' = {
  name: '${policyData.client}-Azure Defender for DNS should be enabled'
  params: {
    client: policyData.client
  }
}

module lt2_azure_defender_for_sql_should_be_enabled_for_unprotected_sql_managed_instances_policy './policies/lt2_azure_defender_for_sql_should_be_enabled_for_unprotected_sql_managed_instances_policy.bicep' = {
  name: '${policyData.client}-Azure Defender for SQL should be enabled for unprotected SQL Managed Instances'
  params: {
    client: policyData.client
  }
}

module lt2_azure_defender_for_resource_manager_should_be_enabled_policy './policies/lt2_azure_defender_for_resource_manager_should_be_enabled_policy.bicep' = {
  name: '${policyData.client}-Azure Defender for Resource Manager should be enabled'
  params: {
    client: policyData.client
  }
}

module lt2_azure_defender_for_open_source_relational_databases_should_be_enabled_policy './policies/lt2_azure_defender_for_open_source_relational_databases_should_be_enabled_policy.bicep' = {
  name: '${policyData.client}-Azure Defender for open-source relational databases should be enabled'
  params: {
    client: policyData.client
  }
}

module lt2_azure_defender_for_key_vault_should_be_enabled_policy './policies/lt2_azure_defender_for_key_vault_should_be_enabled_policy.bicep' = {
  name: '${policyData.client}-Azure Defender for Key Vault should be enabled'
  params: {
    client: policyData.client
  }
}

module lt2_azure_defender_for_dns_should_be_enabled_policy './policies/lt2_azure_defender_for_dns_should_be_enabled_policy.bicep' = {
  name: '${policyData.client}-Azure Defender for DNS should be enabled'
  params: {
    client: policyData.client
  }
}

module lt3_resource_logs_in_service_bus_should_be_enabled_policy './policies/lt3_resource_logs_in_service_bus_should_be_enabled_policy.bicep' = {
  name: '${policyData.client}-Resource logs in Service Bus should be enabled'
  params: {
    client: policyData.client
  }
}

module lt3_resource_logs_in_azure_stream_analytics_should_be_enabled_policy './policies/lt3_resource_logs_in_azure_stream_analytics_should_be_enabled_policy.bicep' = {
  name: '${policyData.client}-Resource logs in Azure Stream Analytics should be enabled'
  params: {
    client: policyData.client
  }
}

module lt3_resource_logs_in_search_services_should_be_enabled_policy './policies/lt3_resource_logs_in_search_services_should_be_enabled_policy.bicep' = {
  name: '${policyData.client}-Resource logs in Search services should be enabled'
  params: {
    client: policyData.client
  }
}

module lt3_resource_logs_in_data_lake_analytics_should_be_enabled_policy './policies/lt3_resource_logs_in_data_lake_analytics_should_be_enabled_policy.bicep' = {
  name: '${policyData.client}-Resource logs in Data Lake Analytics should be enabled'
  params: {
    client: policyData.client
  }
}

module lt3_resource_logs_in_azure_data_lake_store_should_be_enabled_policy './policies/lt3_resource_logs_in_azure_data_lake_store_should_be_enabled_policy.bicep' = {
  name: '${policyData.client}-Resource logs in Azure Data Lake Store should be enabled'
  params: {
    client: policyData.client
  }
}

module lt5_log_analytics_agent_should_be_installed_on_your_virtual_machine_for_azure_security_center_monitoring_policy './policies/lt5_log_analytics_agent_should_be_installed_on_your_virtual_machine_for_azure_security_center_monitoring_policy.bicep' = {
  name: '${policyData.client}-Log Analytics agent should be installed on your virtual machine for Azure Security Center monitoring'
  params: {
    client: policyData.client
  }
}

module lt5_auto_provisioning_of_the_log_analytics_agent_should_be_enabled_on_your_subscription_policy './policies/lt5_auto_provisioning_of_the_log_analytics_agent_should_be_enabled_on_your_subscription_policy.bicep' = {
  name: '${policyData.client}-Auto provisioning of the Log Analytics agent should be enabled on your subscription'
  params: {
    client: policyData.client
  }
}

module lt5_linux_machines_should_have_log_analytics_agent_installed_on_azure_arc_policy './policies/lt5_linux_machines_should_have_log_analytics_agent_installed_on_azure_arc_policy.bicep' = {
  name: '${policyData.client}-Linux machines should have Log Analytics agent installed on Azure Arc'
  params: {
    client: policyData.client
  }
}

module lt5_log_analytics_agent_should_be_installed_on_your_virtual_machine_scale_sets_for_azure_security_center_monitoring_policy './policies/lt5_log_analytics_agent_should_be_installed_on_your_virtual_machine_scale_sets_for_azure_security_center_monitoring_policy.bicep' = {
  name: '${policyData.client}-Log Analytics agent should be installed on your virtual machine scale sets for Azure Security Center monitoring'
  params: {
    client: policyData.client
  }
}

module lt5_windows_machines_should_have_log_analytics_agent_installed_on_azure_arc_policy './policies/lt5_windows_machines_should_have_log_analytics_agent_installed_on_azure_arc_policy.bicep' = {
  name: '${policyData.client}-Windows machines should have Log Analytics agent installed on Azure Arc'
  params: {
    client: policyData.client
  }
}

module lt6_sql_servers_with_auditing_to_storage_account_destination_should_be_configured_with_90_days_retention_or_higher_policy './policies/lt6_sql_servers_with_auditing_to_storage_account_destination_should_be_configured_with_90_days_retention_or_higher_policy.bicep' = {
  name: '${policyData.client}-SQL servers with auditing to storage account destination should be configured with 90 days retention or higher'
  params: {
    client: policyData.client
  }
}

module am2_storage_accounts_should_be_migrated_to_new_azure_resource_manager_resources_policy './policies/am2_storage_accounts_should_be_migrated_to_new_azure_resource_manager_resources_policy.bicep' = {
  name: '${policyData.client}-Storage accounts should be migrated to new Azure Resource Manager resources'
  params: {
    client: policyData.client
  }
}

module am2_virtual_machines_should_be_migrated_to_new_azure_resource_manager_resources_policy './policies/am2_virtual_machines_should_be_migrated_to_new_azure_resource_manager_resources_policy.bicep' = {
  name: '${policyData.client}-Virtual machines should be migrated to new Azure Resource Manager resources'
  params: {
    client: policyData.client
  }
}

module dp2_azure_defender_for_sql_should_be_enabled_for_unprotected_sql_managed_instances_policy './policies/dp2_azure_defender_for_sql_should_be_enabled_for_unprotected_sql_managed_instances_policy.bicep' = {
  name: '${policyData.client}-Azure Defender for SQL should be enabled for unprotected SQL Managed Instances'
  params: {
    client: policyData.client
  }
}

module dp2_azure_defender_for_open_source_relational_databases_should_be_enabled_policy './policies/dp2_azure_defender_for_open_source_relational_databases_should_be_enabled_policy.bicep' = {
  name: '${policyData.client}-Azure Defender for open-source relational databases should be enabled'
  params: {
    client: policyData.client
  }
}

module dp2_azure_defender_for_sql_servers_on_machines_should_be_enabled_policy './policies/dp2_azure_defender_for_sql_servers_on_machines_should_be_enabled_policy.bicep' = {
  name: '${policyData.client}-Azure Defender for SQL servers on machines should be enabled'
  params: {
    client: policyData.client
  }
}

module dp2_azure_defender_for_azure_sql_database_servers_should_be_enabled_policy './policies/dp2_azure_defender_for_azure_sql_database_servers_should_be_enabled_policy.bicep' = {
  name: '${policyData.client}-Azure Defender for Azure SQL Database servers should be enabled'
  params: {
    client: policyData.client
  }
}

module dp2_azure_defender_for_storage_should_be_enabled_policy './policies/dp2_azure_defender_for_storage_should_be_enabled_policy.bicep' = {
  name: '${policyData.client}-Azure Defender for Storage should be enabled'
  params: {
    client: policyData.client
  }
}

module dp3_function_app_should_only_be_accessible_over_https_policy './policies/dp3_function_app_should_only_be_accessible_over_https_policy.bicep' = {
  name: '${policyData.client}-Function App should only be accessible over HTTPS'
  params: {
    client: policyData.client
  }
}

module dp3_kubernetes_clusters_should_be_accessible_only_over_https_policy './policies/dp3_kubernetes_clusters_should_be_accessible_only_over_https_policy.bicep' = {
  name: '${policyData.client}-Kubernetes clusters should be accessible only over HTTPS'
  params: {
    client: policyData.client
  }
}

module dp3_api_app_should_only_be_accessible_over_https_policy './policies/dp3_api_app_should_only_be_accessible_over_https_policy.bicep' = {
  name: '${policyData.client}-API App should only be accessible over HTTPS'
  params: {
    client: policyData.client
  }
}

module dp3_ftps_only_should_be_required_in_your_function_app_policy './policies/dp3_ftps_only_should_be_required_in_your_function_app_policy.bicep' = {
  name: '${policyData.client}-FTPS only should be required in your Function App'
  params: {
    client: policyData.client
  }
}

module dp3_windows_web_servers_should_be_configured_to_use_secure_communication_protocols_policy './policies/dp3_windows_web_servers_should_be_configured_to_use_secure_communication_protocols_policy.bicep' = {
  name: '${policyData.client}-Windows web servers should be configured to use secure communication protocols'
  params: {
    client: policyData.client
  }
}

module dp4_virtual_machines_should_encrypt_temp_disks__caches__and_data_flows_between_compute_and_storage_resources_policy './policies/dp4_virtual_machines_should_encrypt_temp_disks__caches__and_data_flows_between_compute_and_storage_resources_policy.bicep' = {
  name: '${policyData.client}-Virtual machines should encrypt temp disks, caches, and data flows between Compute and Storage resources'
  params: {
    client: policyData.client
  }
}

module dp4_automation_account_variables_should_be_encrypted_policy './policies/dp4_automation_account_variables_should_be_encrypted_policy.bicep' = {
  name: '${policyData.client}-Automation account variables should be encrypted'
  params: {
    client: policyData.client
  }
}

module dp4_service_fabric_clusters_should_have_the_clusterprotectionlevel_property_set_to_encryptandsign_policy './policies/dp4_service_fabric_clusters_should_have_the_clusterprotectionlevel_property_set_to_encryptandsign_policy.bicep' = {
  name: '${policyData.client}-Service Fabric clusters should have the ClusterProtectionLevel property set to EncryptAndSign'
  params: {
    client: policyData.client
  }
}

module dp4_transparent_data_encryption_on_sql_databases_should_be_enabled_policy './policies/dp4_transparent_data_encryption_on_sql_databases_should_be_enabled_policy.bicep' = {
  name: '${policyData.client}-Transparent Data Encryption on SQL databases should be enabled'
  params: {
    client: policyData.client
  }
}

module dp5_storage_accounts_should_use_customer_managed_key_for_encryption_policy './policies/dp5_storage_accounts_should_use_customer_managed_key_for_encryption_policy.bicep' = {
  name: '${policyData.client}-Storage accounts should use customer-managed key for encryption'
  params: {
    client: policyData.client
  }
}

module dp5_azure_machine_learning_workspaces_should_be_encrypted_with_a_customer_managed_key_policy './policies/dp5_azure_machine_learning_workspaces_should_be_encrypted_with_a_customer_managed_key_policy.bicep' = {
  name: '${policyData.client}-Azure Machine Learning workspaces should be encrypted with a customer-managed key'
  params: {
    client: policyData.client
  }
}

module dp5_container_registries_should_be_encrypted_with_a_customer_managed_key_policy './policies/dp5_container_registries_should_be_encrypted_with_a_customer_managed_key_policy.bicep' = {
  name: '${policyData.client}-Container registries should be encrypted with a customer-managed key'
  params: {
    client: policyData.client
  }
}

module dp5_azure_cosmos_db_accounts_should_use_customer_managed_keys_to_encrypt_data_at_rest_policy './policies/dp5_azure_cosmos_db_accounts_should_use_customer_managed_keys_to_encrypt_data_at_rest_policy.bicep' = {
  name: '${policyData.client}-Azure Cosmos DB accounts should use customer-managed keys to encrypt data at rest'
  params: {
    client: policyData.client
  }
}

module dp5_mysql_servers_should_use_customer_managed_keys_to_encrypt_data_at_rest_policy './policies/dp5_mysql_servers_should_use_customer_managed_keys_to_encrypt_data_at_rest_policy.bicep' = {
  name: '${policyData.client}-MySQL servers should use customer-managed keys to encrypt data at rest'
  params: {
    client: policyData.client
  }
}

module dp6_key_vault_keys_should_have_an_expiration_date_policy './policies/dp6_key_vault_keys_should_have_an_expiration_date_policy.bicep' = {
  name: '${policyData.client}-Key Vault keys should have an expiration date'
  params: {
    client: policyData.client
  }
}

module dp6_key_vault_secrets_should_have_an_expiration_date_policy './policies/dp6_key_vault_secrets_should_have_an_expiration_date_policy.bicep' = {
  name: '${policyData.client}-Key Vault secrets should have an expiration date'
  params: {
    client: policyData.client
  }
}

module dp8_azure_defender_for_key_vault_should_be_enabled_policy './policies/dp8_azure_defender_for_key_vault_should_be_enabled_policy.bicep' = {
  name: '${policyData.client}-Azure Defender for Key Vault should be enabled'
  params: {
    client: policyData.client
  }
}

module dp8_resource_logs_in_key_vault_should_be_enabled_policy './policies/dp8_resource_logs_in_key_vault_should_be_enabled_policy.bicep' = {
  name: '${policyData.client}-Resource logs in Key Vault should be enabled'
  params: {
    client: policyData.client
  }
}

module dp8_key_vaults_should_have_soft_delete_enabled_policy './policies/dp8_key_vaults_should_have_soft_delete_enabled_policy.bicep' = {
  name: '${policyData.client}-Key vaults should have soft delete enabled'
  params: {
    client: policyData.client
  }
}

module dp8_azure_key_vault_should_disable_public_network_access_policy './policies/dp8_azure_key_vault_should_disable_public_network_access_policy.bicep' = {
  name: '${policyData.client}-Azure Key Vault should disable public network access'
  params: {
    client: policyData.client
  }
}

module dp8_key_vaults_should_have_purge_protection_enabled_policy './policies/dp8_key_vaults_should_have_purge_protection_enabled_policy.bicep' = {
  name: '${policyData.client}-Key vaults should have purge protection enabled'
  params: {
    client: policyData.client
  }
}

module dp7_certificates_should_have_the_specified_maximum_validity_period_policy './policies/dp7_certificates_should_have_the_specified_maximum_validity_period_policy.bicep' = {
  name: '${policyData.client}-Certificates should have the specified maximum validity period'
  params: {
    client: policyData.client
  }
}

module pa1_there_should_be_more_than_one_owner_assigned_to_your_subscription_policy './policies/pa1_there_should_be_more_than_one_owner_assigned_to_your_subscription_policy.bicep' = {
  name: '${policyData.client}-There should be more than one owner assigned to your subscription'
  params: {
    client: policyData.client
  }
}

module pa1_a_maximum_of_3_owners_should_be_designated_for_your_subscription_policy './policies/pa1_a_maximum_of_3_owners_should_be_designated_for_your_subscription_policy.bicep' = {
  name: '${policyData.client}-A maximum of 3 owners should be designated for your subscription'
  params: {
    client: policyData.client
  }
}

module pa1_external_accounts_with_owner_permissions_should_be_removed_from_your_subscription_policy './policies/pa1_external_accounts_with_owner_permissions_should_be_removed_from_your_subscription_policy.bicep' = {
  name: '${policyData.client}-External accounts with owner permissions should be removed from your subscription'
  params: {
    client: policyData.client
  }
}

module pa1_deprecated_accounts_with_owner_permissions_should_be_removed_from_your_subscription_policy './policies/pa1_deprecated_accounts_with_owner_permissions_should_be_removed_from_your_subscription_policy.bicep' = {
  name: '${policyData.client}-Deprecated accounts with owner permissions should be removed from your subscription'
  params: {
    client: policyData.client
  }
}

module pa2_management_ports_of_virtual_machines_should_be_protected_with_just_in_time_network_access_control_policy './policies/pa2_management_ports_of_virtual_machines_should_be_protected_with_just_in_time_network_access_control_policy.bicep' = {
  name: '${policyData.client}-Management ports of virtual machines should be protected with just-in-time network access control'
  params: {
    client: policyData.client
  }
}

module pa4_external_accounts_with_read_permissions_should_be_removed_from_your_subscription_policy './policies/pa4_external_accounts_with_read_permissions_should_be_removed_from_your_subscription_policy.bicep' = {
  name: '${policyData.client}-External accounts with read permissions should be removed from your subscription'
  params: {
    client: policyData.client
  }
}

module pa4_external_accounts_with_owner_permissions_should_be_removed_from_your_subscription_policy './policies/pa4_external_accounts_with_owner_permissions_should_be_removed_from_your_subscription_policy.bicep' = {
  name: '${policyData.client}-External accounts with owner permissions should be removed from your subscription'
  params: {
    client: policyData.client
  }
}

module pa4_deprecated_accounts_should_be_removed_from_your_subscription_policy './policies/pa4_deprecated_accounts_should_be_removed_from_your_subscription_policy.bicep' = {
  name: '${policyData.client}-Deprecated accounts should be removed from your subscription'
  params: {
    client: policyData.client
  }
}

module pa4_deprecated_accounts_with_owner_permissions_should_be_removed_from_your_subscription_policy './policies/pa4_deprecated_accounts_with_owner_permissions_should_be_removed_from_your_subscription_policy.bicep' = {
  name: '${policyData.client}-Deprecated accounts with owner permissions should be removed from your subscription'
  params: {
    client: policyData.client
  }
}

module pa4_external_accounts_with_write_permissions_should_be_removed_from_your_subscription_policy './policies/pa4_external_accounts_with_write_permissions_should_be_removed_from_your_subscription_policy.bicep' = {
  name: '${policyData.client}-External accounts with write permissions should be removed from your subscription'
  params: {
    client: policyData.client
  }
}

module pa7_role_based_access_control_rbac_should_be_used_on_kubernetes_services_policy './policies/pa7_role_based_access_control_rbac_should_be_used_on_kubernetes_services_policy.bicep' = {
  name: '${policyData.client}-Role-Based Access Control (RBAC) should be used on Kubernetes Services'
  params: {
    client: policyData.client
  }
}

module im1_an_azure_active_directory_administrator_should_be_provisioned_for_sql_servers_policy './policies/im1_an_azure_active_directory_administrator_should_be_provisioned_for_sql_servers_policy.bicep' = {
  name: '${policyData.client}-An Azure Active Directory administrator should be provisioned for SQL servers'
  params: {
    client: policyData.client
  }
}

module im1_service_fabric_clusters_should_only_use_azure_active_directory_for_client_authentication_policy './policies/im1_service_fabric_clusters_should_only_use_azure_active_directory_for_client_authentication_policy.bicep' = {
  name: '${policyData.client}-Service Fabric clusters should only use Azure Active Directory for client authentication'
  params: {
    client: policyData.client
  }
}

module im3_managed_identity_should_be_used_in_your_api_app_policy './policies/im3_managed_identity_should_be_used_in_your_api_app_policy.bicep' = {
  name: '${policyData.client}-Managed identity should be used in your API App'
  params: {
    client: policyData.client
  }
}

module im3_virtual_machines_guest_configuration_extension_should_be_deployed_with_system_assigned_managed_identity_policy './policies/im3_virtual_machines_guest_configuration_extension_should_be_deployed_with_system_assigned_managed_identity_policy.bicep' = {
  name: '${policyData.client}-Virtual machines Guest Configuration extension should be deployed with system-assigned managed identity'
  params: {
    client: policyData.client
  }
}

module im3_managed_identity_should_be_used_in_your_web_app_policy './policies/im3_managed_identity_should_be_used_in_your_web_app_policy.bicep' = {
  name: '${policyData.client}-Managed identity should be used in your Web App'
  params: {
    client: policyData.client
  }
}

module im3_managed_identity_should_be_used_in_your_function_app_policy './policies/im3_managed_identity_should_be_used_in_your_function_app_policy.bicep' = {
  name: '${policyData.client}-Managed identity should be used in your Function App'
  params: {
    client: policyData.client
  }
}

module im6_mfa_should_be_enabled_on_accounts_with_read_permissions_on_your_subscription_policy './policies/im6_mfa_should_be_enabled_on_accounts_with_read_permissions_on_your_subscription_policy.bicep' = {
  name: '${policyData.client}-MFA should be enabled on accounts with read permissions on your subscription'
  params: {
    client: policyData.client
  }
}

module im6_mfa_should_be_enabled_accounts_with_write_permissions_on_your_subscription_policy './policies/im6_mfa_should_be_enabled_accounts_with_write_permissions_on_your_subscription_policy.bicep' = {
  name: '${policyData.client}-MFA should be enabled accounts with write permissions on your subscription'
  params: {
    client: policyData.client
  }
}

module im6_mfa_should_be_enabled_on_accounts_with_owner_permissions_on_your_subscription_policy './policies/im6_mfa_should_be_enabled_on_accounts_with_owner_permissions_on_your_subscription_policy.bicep' = {
  name: '${policyData.client}-MFA should be enabled on accounts with owner permissions on your subscription'
  params: {
    client: policyData.client
  }
}

module im6_authentication_to_linux_machines_should_require_ssh_keys_policy './policies/im6_authentication_to_linux_machines_should_require_ssh_keys_policy.bicep' = {
  name: '${policyData.client}-Authentication to Linux machines should require SSH keys'
  params: {
    client: policyData.client
  }
}

module ns1_adaptive_network_hardening_recommendations_should_be_applied_on_internet_facing_virtual_machines_policy './policies/ns1_adaptive_network_hardening_recommendations_should_be_applied_on_internet_facing_virtual_machines_policy.bicep' = {
  name: '${policyData.client}-Adaptive network hardening recommendations should be applied on internet facing virtual machines'
  params: {
    client: policyData.client
  }
}

module ns1_subnets_should_be_associated_with_a_network_security_group_policy './policies/ns1_subnets_should_be_associated_with_a_network_security_group_policy.bicep' = {
  name: '${policyData.client}-Subnets should be associated with a Network Security Group'
  params: {
    client: policyData.client
  }
}

module ns1_non_internet_facing_virtual_machines_should_be_protected_with_network_security_groups_policy './policies/ns1_non_internet_facing_virtual_machines_should_be_protected_with_network_security_groups_policy.bicep' = {
  name: '${policyData.client}-Non-internet-facing virtual machines should be protected with network security groups'
  params: {
    client: policyData.client
  }
}

module ns1_internet_facing_virtual_machines_should_be_protected_with_network_security_groups_policy './policies/ns1_internet_facing_virtual_machines_should_be_protected_with_network_security_groups_policy.bicep' = {
  name: '${policyData.client}-Internet-facing virtual machines should be protected with network security groups'
  params: {
    client: policyData.client
  }
}

module ns1_all_network_ports_should_be_restricted_on_network_security_groups_associated_to_your_virtual_machine_policy './policies/ns1_all_network_ports_should_be_restricted_on_network_security_groups_associated_to_your_virtual_machine_policy.bicep' = {
  name: '${policyData.client}-All network ports should be restricted on network security groups associated to your virtual machine'
  params: {
    client: policyData.client
  }
}

module ns2_storage_accounts_should_use_private_link_policy './policies/ns2_storage_accounts_should_use_private_link_policy.bicep' = {
  name: '${policyData.client}-Storage accounts should use private link'
  params: {
    client: policyData.client
  }
}

module ns2_storage_accounts_should_restrict_network_access_using_virtual_network_rules_policy './policies/ns2_storage_accounts_should_restrict_network_access_using_virtual_network_rules_policy.bicep' = {
  name: '${policyData.client}-Storage accounts should restrict network access using virtual network rules'
  params: {
    client: policyData.client
  }
}

module ns2_storage_account_public_access_should_be_disallowed_policy './policies/ns2_storage_account_public_access_should_be_disallowed_policy.bicep' = {
  name: '${policyData.client}-Storage account public access should be disallowed'
  params: {
    client: policyData.client
  }
}

module ns2_cognitive_services_accounts_should_restrict_network_access_policy './policies/ns2_cognitive_services_accounts_should_restrict_network_access_policy.bicep' = {
  name: '${policyData.client}-Cognitive Services accounts should restrict network access'
  params: {
    client: policyData.client
  }
}

module ns2_vm_image_builder_templates_should_use_private_link_policy './policies/ns2_vm_image_builder_templates_should_use_private_link_policy.bicep' = {
  name: '${policyData.client}-VM Image Builder templates should use private link'
  params: {
    client: policyData.client
  }
}

module ns3_all_internet_traffic_should_be_routed_via_your_deployed_azure_firewall_policy './policies/ns3_all_internet_traffic_should_be_routed_via_your_deployed_azure_firewall_policy.bicep' = {
  name: '${policyData.client}-All Internet traffic should be routed via your deployed Azure Firewall'
  params: {
    client: policyData.client
  }
}

module ns3_ip_forwarding_on_your_virtual_machine_should_be_disabled_policy './policies/ns3_ip_forwarding_on_your_virtual_machine_should_be_disabled_policy.bicep' = {
  name: '${policyData.client}-IP Forwarding on your virtual machine should be disabled'
  params: {
    client: policyData.client
  }
}

module ns3_management_ports_should_be_closed_on_your_virtual_machines_policy './policies/ns3_management_ports_should_be_closed_on_your_virtual_machines_policy.bicep' = {
  name: '${policyData.client}-Management ports should be closed on your virtual machines'
  params: {
    client: policyData.client
  }
}

module ns3_management_ports_of_virtual_machines_should_be_protected_with_just_in_time_network_access_control_policy './policies/ns3_management_ports_of_virtual_machines_should_be_protected_with_just_in_time_network_access_control_policy.bicep' = {
  name: '${policyData.client}-Management ports of virtual machines should be protected with just-in-time network access control'
  params: {
    client: policyData.client
  }
}

module ns5_azure_ddos_protection_standard_should_be_enabled_policy './policies/ns5_azure_ddos_protection_standard_should_be_enabled_policy.bicep' = {
  name: '${policyData.client}-Azure DDoS Protection Standard should be enabled'
  params: {
    client: policyData.client
  }
}

module ns6_web_application_firewall_waf_should_be_enabled_for_application_gateway_policy './policies/ns6_web_application_firewall_waf_should_be_enabled_for_application_gateway_policy.bicep' = {
  name: '${policyData.client}-Web Application Firewall (WAF) should be enabled for Application Gateway'
  params: {
    client: policyData.client
  }
}

module ns6_azure_web_application_firewall_should_be_enabled_for_azure_front_door_entry_points_policy './policies/ns6_azure_web_application_firewall_should_be_enabled_for_azure_front_door_entry_points_policy.bicep' = {
  name: '${policyData.client}-Azure Web Application Firewall should be enabled for Azure Front Door entry-points'
  params: {
    client: policyData.client
  }
}

module ns7_adaptive_network_hardening_recommendations_should_be_applied_on_internet_facing_virtual_machines_policy './policies/ns7_adaptive_network_hardening_recommendations_should_be_applied_on_internet_facing_virtual_machines_policy.bicep' = {
  name: '${policyData.client}-Adaptive network hardening recommendations should be applied on internet facing virtual machines'
  params: {
    client: policyData.client
  }
}

module ns8_latest_tls_version_should_be_used_in_your_api_app_policy './policies/ns8_latest_tls_version_should_be_used_in_your_api_app_policy.bicep' = {
  name: '${policyData.client}-Latest TLS version should be used in your API App'
  params: {
    client: policyData.client
  }
}

module ns8_latest_tls_version_should_be_used_in_your_web_app_policy './policies/ns8_latest_tls_version_should_be_used_in_your_web_app_policy.bicep' = {
  name: '${policyData.client}-Latest TLS version should be used in your Web App'
  params: {
    client: policyData.client
  }
}

module ns8_latest_tls_version_should_be_used_in_your_function_app_policy './policies/ns8_latest_tls_version_should_be_used_in_your_function_app_policy.bicep' = {
  name: '${policyData.client}-Latest TLS version should be used in your Function App'
  params: {
    client: policyData.client
  }
}

module ns10_azure_defender_for_dns_should_be_enabled_policy './policies/ns10_azure_defender_for_dns_should_be_enabled_policy.bicep' = {
  name: '${policyData.client}-Azure Defender for DNS should be enabled'
  params: {
    client: policyData.client
  }
}

resource policyDefSet 'Microsoft.Authorization/policySetDefinitions@2021-06-01' = {
  name: '${policyData.client}-${policyData.name}'
  dependsOn: [
    am2_storage_accounts_should_be_migrated_to_new_azure_resource_manager_resources_policy
    am2_virtual_machines_should_be_migrated_to_new_azure_resource_manager_resources_policy
    br1_azure_backup_should_be_enabled_for_virtual_machines_policy
    br1_geo_redundant_backup_should_be_enabled_for_azure_database_for_mariadb_policy
    br1_geo_redundant_backup_should_be_enabled_for_azure_database_for_mysql_policy
    br1_geo_redundant_backup_should_be_enabled_for_azure_database_for_postgresql_policy
    br2_azure_backup_should_be_enabled_for_virtual_machines_policy
    br2_geo_redundant_backup_should_be_enabled_for_azure_database_for_mariadb_policy
    br2_geo_redundant_backup_should_be_enabled_for_azure_database_for_mysql_policy
    br2_geo_redundant_backup_should_be_enabled_for_azure_database_for_postgresql_policy
    dp2_azure_defender_for_azure_sql_database_servers_should_be_enabled_policy
    dp2_azure_defender_for_open_source_relational_databases_should_be_enabled_policy
    dp2_azure_defender_for_sql_servers_on_machines_should_be_enabled_policy
    dp2_azure_defender_for_sql_should_be_enabled_for_unprotected_sql_managed_instances_policy
    dp2_azure_defender_for_storage_should_be_enabled_policy
    dp3_api_app_should_only_be_accessible_over_https_policy
    dp3_ftps_only_should_be_required_in_your_function_app_policy
    dp3_function_app_should_only_be_accessible_over_https_policy
    dp3_kubernetes_clusters_should_be_accessible_only_over_https_policy
    dp3_windows_web_servers_should_be_configured_to_use_secure_communication_protocols_policy
    dp4_automation_account_variables_should_be_encrypted_policy
    dp4_service_fabric_clusters_should_have_the_clusterprotectionlevel_property_set_to_encryptandsign_policy
    dp4_transparent_data_encryption_on_sql_databases_should_be_enabled_policy
    dp4_virtual_machines_should_encrypt_temp_disks__caches__and_data_flows_between_compute_and_storage_resources_policy
    dp5_azure_cosmos_db_accounts_should_use_customer_managed_keys_to_encrypt_data_at_rest_policy
    dp5_azure_machine_learning_workspaces_should_be_encrypted_with_a_customer_managed_key_policy
    dp5_container_registries_should_be_encrypted_with_a_customer_managed_key_policy
    dp5_mysql_servers_should_use_customer_managed_keys_to_encrypt_data_at_rest_policy
    dp5_storage_accounts_should_use_customer_managed_key_for_encryption_policy
    dp6_key_vault_keys_should_have_an_expiration_date_policy
    dp6_key_vault_secrets_should_have_an_expiration_date_policy
    dp7_certificates_should_have_the_specified_maximum_validity_period_policy
    dp8_azure_defender_for_key_vault_should_be_enabled_policy
    dp8_azure_key_vault_should_disable_public_network_access_policy
    dp8_key_vaults_should_have_purge_protection_enabled_policy
    dp8_key_vaults_should_have_soft_delete_enabled_policy
    dp8_resource_logs_in_key_vault_should_be_enabled_policy
    es1_azure_defender_for_servers_should_be_enabled_policy
    es2_endpoint_protection_health_issues_should_be_resolved_on_your_machines_policy
    es2_endpoint_protection_should_be_installed_on_your_machines_policy
    es2_endpoint_protection_solution_should_be_installed_on_virtual_machine_scale_sets_policy
    es2_windows_defender_exploit_guard_should_be_enabled_on_your_machines_policy
    es3_endpoint_protection_health_issues_should_be_resolved_on_your_machines_policy
    im1_an_azure_active_directory_administrator_should_be_provisioned_for_sql_servers_policy
    im1_service_fabric_clusters_should_only_use_azure_active_directory_for_client_authentication_policy
    im3_managed_identity_should_be_used_in_your_api_app_policy
    im3_managed_identity_should_be_used_in_your_function_app_policy
    im3_managed_identity_should_be_used_in_your_web_app_policy
    im3_virtual_machines_guest_configuration_extension_should_be_deployed_with_system_assigned_managed_identity_policy
    im6_authentication_to_linux_machines_should_require_ssh_keys_policy
    im6_mfa_should_be_enabled_accounts_with_write_permissions_on_your_subscription_policy
    im6_mfa_should_be_enabled_on_accounts_with_owner_permissions_on_your_subscription_policy
    im6_mfa_should_be_enabled_on_accounts_with_read_permissions_on_your_subscription_policy
    ir2_email_notification_for_high_severity_alerts_should_be_enabled_policy
    ir2_email_notification_to_subscription_owner_for_high_severity_alerts_should_be_enabled_policy
    ir2_subscriptions_should_have_a_contact_email_address_for_security_issues_policy
    ir3_azure_defender_for_dns_should_be_enabled_policy
    ir3_azure_defender_for_key_vault_should_be_enabled_policy
    ir3_azure_defender_for_open_source_relational_databases_should_be_enabled_policy
    ir3_azure_defender_for_resource_manager_should_be_enabled_policy
    ir3_azure_defender_for_sql_should_be_enabled_for_unprotected_sql_managed_instances_policy
    ir4_network_watcher_should_be_enabled_policy
    ir5_azure_defender_for_dns_should_be_enabled_policy
    ir5_azure_defender_for_key_vault_should_be_enabled_policy
    ir5_azure_defender_for_open_source_relational_databases_should_be_enabled_policy
    ir5_azure_defender_for_resource_manager_should_be_enabled_policy
    ir5_azure_defender_for_sql_should_be_enabled_for_unprotected_sql_managed_instances_policy
    lt1_azure_defender_for_dns_should_be_enabled_policy
    lt1_azure_defender_for_key_vault_should_be_enabled_policy
    lt1_azure_defender_for_open_source_relational_databases_should_be_enabled_policy
    lt1_azure_defender_for_resource_manager_should_be_enabled_policy
    lt1_azure_defender_for_sql_should_be_enabled_for_unprotected_sql_managed_instances_policy
    lt2_azure_defender_for_dns_should_be_enabled_policy
    lt2_azure_defender_for_key_vault_should_be_enabled_policy
    lt2_azure_defender_for_open_source_relational_databases_should_be_enabled_policy
    lt2_azure_defender_for_resource_manager_should_be_enabled_policy
    lt2_azure_defender_for_sql_should_be_enabled_for_unprotected_sql_managed_instances_policy
    lt3_resource_logs_in_azure_data_lake_store_should_be_enabled_policy
    lt3_resource_logs_in_azure_stream_analytics_should_be_enabled_policy
    lt3_resource_logs_in_data_lake_analytics_should_be_enabled_policy
    lt3_resource_logs_in_search_services_should_be_enabled_policy
    lt3_resource_logs_in_service_bus_should_be_enabled_policy
    lt5_auto_provisioning_of_the_log_analytics_agent_should_be_enabled_on_your_subscription_policy
    lt5_linux_machines_should_have_log_analytics_agent_installed_on_azure_arc_policy
    lt5_log_analytics_agent_should_be_installed_on_your_virtual_machine_for_azure_security_center_monitoring_policy
    lt5_log_analytics_agent_should_be_installed_on_your_virtual_machine_scale_sets_for_azure_security_center_monitoring_policy
    lt5_windows_machines_should_have_log_analytics_agent_installed_on_azure_arc_policy
    lt6_sql_servers_with_auditing_to_storage_account_destination_should_be_configured_with_90_days_retention_or_higher_policy
    ns10_azure_defender_for_dns_should_be_enabled_policy
    ns1_adaptive_network_hardening_recommendations_should_be_applied_on_internet_facing_virtual_machines_policy
    ns1_all_network_ports_should_be_restricted_on_network_security_groups_associated_to_your_virtual_machine_policy
    ns1_internet_facing_virtual_machines_should_be_protected_with_network_security_groups_policy
    ns1_non_internet_facing_virtual_machines_should_be_protected_with_network_security_groups_policy
    ns1_subnets_should_be_associated_with_a_network_security_group_policy
    ns2_cognitive_services_accounts_should_restrict_network_access_policy
    ns2_storage_accounts_should_restrict_network_access_using_virtual_network_rules_policy
    ns2_storage_accounts_should_use_private_link_policy
    ns2_storage_account_public_access_should_be_disallowed_policy
    ns2_vm_image_builder_templates_should_use_private_link_policy
    ns3_all_internet_traffic_should_be_routed_via_your_deployed_azure_firewall_policy
    ns3_ip_forwarding_on_your_virtual_machine_should_be_disabled_policy
    ns3_management_ports_of_virtual_machines_should_be_protected_with_just_in_time_network_access_control_policy
    ns3_management_ports_should_be_closed_on_your_virtual_machines_policy
    ns5_azure_ddos_protection_standard_should_be_enabled_policy
    ns6_azure_web_application_firewall_should_be_enabled_for_azure_front_door_entry_points_policy
    ns6_web_application_firewall_waf_should_be_enabled_for_application_gateway_policy
    ns7_adaptive_network_hardening_recommendations_should_be_applied_on_internet_facing_virtual_machines_policy
    ns8_latest_tls_version_should_be_used_in_your_api_app_policy
    ns8_latest_tls_version_should_be_used_in_your_function_app_policy
    ns8_latest_tls_version_should_be_used_in_your_web_app_policy
    pa1_a_maximum_of_3_owners_should_be_designated_for_your_subscription_policy
    pa1_deprecated_accounts_with_owner_permissions_should_be_removed_from_your_subscription_policy
    pa1_external_accounts_with_owner_permissions_should_be_removed_from_your_subscription_policy
    pa1_there_should_be_more_than_one_owner_assigned_to_your_subscription_policy
    pa2_management_ports_of_virtual_machines_should_be_protected_with_just_in_time_network_access_control_policy
    pa4_deprecated_accounts_should_be_removed_from_your_subscription_policy
    pa4_deprecated_accounts_with_owner_permissions_should_be_removed_from_your_subscription_policy
    pa4_external_accounts_with_owner_permissions_should_be_removed_from_your_subscription_policy
    pa4_external_accounts_with_read_permissions_should_be_removed_from_your_subscription_policy
    pa4_external_accounts_with_write_permissions_should_be_removed_from_your_subscription_policy
    pa7_role_based_access_control_rbac_should_be_used_on_kubernetes_services_policy
    pv2_cors_should_not_allow_every_resource_to_access_your_api_app_policy
    pv2_cors_should_not_allow_every_resource_to_access_your_web_applications_policy
    pv2_kubernetes_clusters_should_not_use_the_default_namespace_policy
    pv2_kubernetes_cluster_pods_should_only_use_approved_host_network_and_port_range_policy
    pv2_kubernetes_cluster_pod_hostpath_volumes_should_only_use_allowed_host_paths_policy
    pv4_guest_attestation_extension_should_be_installed_on_supported_linux_virtual_machines_policy
    pv4_guest_attestation_extension_should_be_installed_on_supported_linux_virtual_machines_scale_sets_policy
    pv4_guest_attestation_extension_should_be_installed_on_supported_windows_virtual_machines_policy
    pv4_vtpm_should_be_enabled_on_supported_virtual_machines_policy
    pv4_windows_machines_should_meet_requirements_of_the_azure_compute_security_baseline_policy
    pv5_a_vulnerability_assessment_solution_should_be_enabled_on_your_virtual_machines_policy
    pv5_vulnerability_assessment_should_be_enabled_on_sql_managed_instance_policy
    pv5_vulnerability_assessment_should_be_enabled_on_your_sql_servers_policy
    pv6_container_registry_images_should_have_vulnerability_findings_resolved_policy
    pv6_ensure_that_java_version_is_the_latest__if_used_as_a_part_of_the_function_app_policy
    pv6_ensure_that_python_version_is_the_latest__if_used_as_a_part_of_the_api_app_policy
    pv6_ensure_that_python_version_is_the_latest__if_used_as_a_part_of_the_web_app_policy
    pv6_sql_servers_on_machines_should_have_vulnerability_findings_resolved_policy
    am2_storage_accounts_should_be_migrated_to_new_azure_resource_manager_resources_policy
    am2_virtual_machines_should_be_migrated_to_new_azure_resource_manager_resources_policy
    br1_azure_backup_should_be_enabled_for_virtual_machines_policy
    br1_geo_redundant_backup_should_be_enabled_for_azure_database_for_mariadb_policy
    br1_geo_redundant_backup_should_be_enabled_for_azure_database_for_mysql_policy
    br1_geo_redundant_backup_should_be_enabled_for_azure_database_for_postgresql_policy
    br2_azure_backup_should_be_enabled_for_virtual_machines_policy
    br2_geo_redundant_backup_should_be_enabled_for_azure_database_for_mariadb_policy
    br2_geo_redundant_backup_should_be_enabled_for_azure_database_for_mysql_policy
    br2_geo_redundant_backup_should_be_enabled_for_azure_database_for_postgresql_policy
    dp2_azure_defender_for_azure_sql_database_servers_should_be_enabled_policy
    dp2_azure_defender_for_open_source_relational_databases_should_be_enabled_policy
    dp2_azure_defender_for_sql_servers_on_machines_should_be_enabled_policy
    dp2_azure_defender_for_sql_should_be_enabled_for_unprotected_sql_managed_instances_policy
    dp2_azure_defender_for_storage_should_be_enabled_policy
    dp3_api_app_should_only_be_accessible_over_https_policy
    dp3_ftps_only_should_be_required_in_your_function_app_policy
    dp3_function_app_should_only_be_accessible_over_https_policy
    dp3_kubernetes_clusters_should_be_accessible_only_over_https_policy
    dp3_windows_web_servers_should_be_configured_to_use_secure_communication_protocols_policy
    dp4_automation_account_variables_should_be_encrypted_policy
    dp4_service_fabric_clusters_should_have_the_clusterprotectionlevel_property_set_to_encryptandsign_policy
    dp4_transparent_data_encryption_on_sql_databases_should_be_enabled_policy
    dp4_virtual_machines_should_encrypt_temp_disks__caches__and_data_flows_between_compute_and_storage_resources_policy
    dp5_azure_cosmos_db_accounts_should_use_customer_managed_keys_to_encrypt_data_at_rest_policy
    dp5_azure_machine_learning_workspaces_should_be_encrypted_with_a_customer_managed_key_policy
    dp5_container_registries_should_be_encrypted_with_a_customer_managed_key_policy
    dp5_mysql_servers_should_use_customer_managed_keys_to_encrypt_data_at_rest_policy
    dp5_storage_accounts_should_use_customer_managed_key_for_encryption_policy
    dp6_key_vault_keys_should_have_an_expiration_date_policy
    dp6_key_vault_secrets_should_have_an_expiration_date_policy
    dp7_certificates_should_have_the_specified_maximum_validity_period_policy
    dp8_azure_defender_for_key_vault_should_be_enabled_policy
    dp8_azure_key_vault_should_disable_public_network_access_policy
    dp8_key_vaults_should_have_purge_protection_enabled_policy
    dp8_key_vaults_should_have_soft_delete_enabled_policy
    dp8_resource_logs_in_key_vault_should_be_enabled_policy
    es1_azure_defender_for_servers_should_be_enabled_policy
    es2_endpoint_protection_health_issues_should_be_resolved_on_your_machines_policy
    es2_endpoint_protection_should_be_installed_on_your_machines_policy
    es2_endpoint_protection_solution_should_be_installed_on_virtual_machine_scale_sets_policy
    es2_windows_defender_exploit_guard_should_be_enabled_on_your_machines_policy
    es3_endpoint_protection_health_issues_should_be_resolved_on_your_machines_policy
    im1_an_azure_active_directory_administrator_should_be_provisioned_for_sql_servers_policy
    im1_service_fabric_clusters_should_only_use_azure_active_directory_for_client_authentication_policy
    im3_managed_identity_should_be_used_in_your_api_app_policy
    im3_managed_identity_should_be_used_in_your_function_app_policy
    im3_managed_identity_should_be_used_in_your_web_app_policy
    im3_virtual_machines_guest_configuration_extension_should_be_deployed_with_system_assigned_managed_identity_policy
    im6_authentication_to_linux_machines_should_require_ssh_keys_policy
    im6_mfa_should_be_enabled_accounts_with_write_permissions_on_your_subscription_policy
    im6_mfa_should_be_enabled_on_accounts_with_owner_permissions_on_your_subscription_policy
    im6_mfa_should_be_enabled_on_accounts_with_read_permissions_on_your_subscription_policy
    ir2_email_notification_for_high_severity_alerts_should_be_enabled_policy
    ir2_email_notification_to_subscription_owner_for_high_severity_alerts_should_be_enabled_policy
    ir2_subscriptions_should_have_a_contact_email_address_for_security_issues_policy
    ir3_azure_defender_for_dns_should_be_enabled_policy
    ir3_azure_defender_for_key_vault_should_be_enabled_policy
    ir3_azure_defender_for_open_source_relational_databases_should_be_enabled_policy
    ir3_azure_defender_for_resource_manager_should_be_enabled_policy
    ir3_azure_defender_for_sql_should_be_enabled_for_unprotected_sql_managed_instances_policy
    ir4_network_watcher_should_be_enabled_policy
    ir5_azure_defender_for_dns_should_be_enabled_policy
    ir5_azure_defender_for_key_vault_should_be_enabled_policy
    ir5_azure_defender_for_open_source_relational_databases_should_be_enabled_policy
    ir5_azure_defender_for_resource_manager_should_be_enabled_policy
    ir5_azure_defender_for_sql_should_be_enabled_for_unprotected_sql_managed_instances_policy
    lt1_azure_defender_for_dns_should_be_enabled_policy
    lt1_azure_defender_for_key_vault_should_be_enabled_policy
    lt1_azure_defender_for_open_source_relational_databases_should_be_enabled_policy
    lt1_azure_defender_for_resource_manager_should_be_enabled_policy
    lt1_azure_defender_for_sql_should_be_enabled_for_unprotected_sql_managed_instances_policy
    lt2_azure_defender_for_dns_should_be_enabled_policy
    lt2_azure_defender_for_key_vault_should_be_enabled_policy
    lt2_azure_defender_for_open_source_relational_databases_should_be_enabled_policy
    lt2_azure_defender_for_resource_manager_should_be_enabled_policy
    lt2_azure_defender_for_sql_should_be_enabled_for_unprotected_sql_managed_instances_policy
    lt5_auto_provisioning_of_the_log_analytics_agent_should_be_enabled_on_your_subscription_policy
    lt5_linux_machines_should_have_log_analytics_agent_installed_on_azure_arc_policy
    lt5_log_analytics_agent_should_be_installed_on_your_virtual_machine_for_azure_security_center_monitoring_policy
    lt5_log_analytics_agent_should_be_installed_on_your_virtual_machine_scale_sets_for_azure_security_center_monitoring_policy
    lt5_windows_machines_should_have_log_analytics_agent_installed_on_azure_arc_policy
    lt6_sql_servers_with_auditing_to_storage_account_destination_should_be_configured_with_90_days_retention_or_higher_policy
    ns10_azure_defender_for_dns_should_be_enabled_policy
    ns1_adaptive_network_hardening_recommendations_should_be_applied_on_internet_facing_virtual_machines_policy
    ns1_all_network_ports_should_be_restricted_on_network_security_groups_associated_to_your_virtual_machine_policy
    ns1_internet_facing_virtual_machines_should_be_protected_with_network_security_groups_policy
    ns1_non_internet_facing_virtual_machines_should_be_protected_with_network_security_groups_policy
    ns1_subnets_should_be_associated_with_a_network_security_group_policy
    ns2_cognitive_services_accounts_should_restrict_network_access_policy
    ns2_storage_accounts_should_restrict_network_access_using_virtual_network_rules_policy
    ns2_storage_accounts_should_use_private_link_policy
    ns2_storage_account_public_access_should_be_disallowed_policy
    ns2_vm_image_builder_templates_should_use_private_link_policy
    ns3_all_internet_traffic_should_be_routed_via_your_deployed_azure_firewall_policy
    ns3_ip_forwarding_on_your_virtual_machine_should_be_disabled_policy
    ns3_management_ports_of_virtual_machines_should_be_protected_with_just_in_time_network_access_control_policy
    ns3_management_ports_should_be_closed_on_your_virtual_machines_policy
    ns5_azure_ddos_protection_standard_should_be_enabled_policy
    ns6_azure_web_application_firewall_should_be_enabled_for_azure_front_door_entry_points_policy
    ns6_web_application_firewall_waf_should_be_enabled_for_application_gateway_policy
    ns7_adaptive_network_hardening_recommendations_should_be_applied_on_internet_facing_virtual_machines_policy
    ns8_latest_tls_version_should_be_used_in_your_api_app_policy
    ns8_latest_tls_version_should_be_used_in_your_function_app_policy
    ns8_latest_tls_version_should_be_used_in_your_web_app_policy
    pa1_a_maximum_of_3_owners_should_be_designated_for_your_subscription_policy
    pa1_deprecated_accounts_with_owner_permissions_should_be_removed_from_your_subscription_policy
    pa1_external_accounts_with_owner_permissions_should_be_removed_from_your_subscription_policy
    pa1_there_should_be_more_than_one_owner_assigned_to_your_subscription_policy
    pa2_management_ports_of_virtual_machines_should_be_protected_with_just_in_time_network_access_control_policy
    pa4_deprecated_accounts_should_be_removed_from_your_subscription_policy
    pa4_deprecated_accounts_with_owner_permissions_should_be_removed_from_your_subscription_policy
    pa4_external_accounts_with_owner_permissions_should_be_removed_from_your_subscription_policy
    pa4_external_accounts_with_read_permissions_should_be_removed_from_your_subscription_policy
    pa4_external_accounts_with_write_permissions_should_be_removed_from_your_subscription_policy
    pa7_role_based_access_control_rbac_should_be_used_on_kubernetes_services_policy
    pv2_cors_should_not_allow_every_resource_to_access_your_api_app_policy
    pv2_cors_should_not_allow_every_resource_to_access_your_web_applications_policy
    pv2_kubernetes_clusters_should_not_use_the_default_namespace_policy
    pv4_guest_attestation_extension_should_be_installed_on_supported_linux_virtual_machines_policy
    pv4_guest_attestation_extension_should_be_installed_on_supported_linux_virtual_machines_scale_sets_policy
    pv4_guest_attestation_extension_should_be_installed_on_supported_windows_virtual_machines_policy
    pv4_vtpm_should_be_enabled_on_supported_virtual_machines_policy
    pv4_windows_machines_should_meet_requirements_of_the_azure_compute_security_baseline_policy
    pv5_a_vulnerability_assessment_solution_should_be_enabled_on_your_virtual_machines_policy
    pv5_vulnerability_assessment_should_be_enabled_on_sql_managed_instance_policy
    pv5_vulnerability_assessment_should_be_enabled_on_your_sql_servers_policy
    pv6_container_registry_images_should_have_vulnerability_findings_resolved_policy
    pv6_ensure_that_java_version_is_the_latest__if_used_as_a_part_of_the_function_app_policy
    pv6_ensure_that_python_version_is_the_latest__if_used_as_a_part_of_the_api_app_policy
    pv6_ensure_that_python_version_is_the_latest__if_used_as_a_part_of_the_web_app_policy
    pv6_sql_servers_on_machines_should_have_vulnerability_findings_resolved_policy
  ]
  properties: {
    policyType: policyData.policyType
    displayName: policyData.policySetDefinitionDisplayName
    parameters: {}
    policyDefinitions: [
      {
        policyDefinitionId: am2_storage_accounts_should_be_migrated_to_new_azure_resource_manager_resources_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: am2_virtual_machines_should_be_migrated_to_new_azure_resource_manager_resources_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: br1_azure_backup_should_be_enabled_for_virtual_machines_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: br1_geo_redundant_backup_should_be_enabled_for_azure_database_for_mariadb_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: br1_geo_redundant_backup_should_be_enabled_for_azure_database_for_mysql_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: br1_geo_redundant_backup_should_be_enabled_for_azure_database_for_postgresql_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: br2_azure_backup_should_be_enabled_for_virtual_machines_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: br2_geo_redundant_backup_should_be_enabled_for_azure_database_for_mariadb_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: br2_geo_redundant_backup_should_be_enabled_for_azure_database_for_mysql_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: br2_geo_redundant_backup_should_be_enabled_for_azure_database_for_postgresql_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: dp2_azure_defender_for_azure_sql_database_servers_should_be_enabled_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: dp2_azure_defender_for_open_source_relational_databases_should_be_enabled_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: dp2_azure_defender_for_sql_servers_on_machines_should_be_enabled_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: dp2_azure_defender_for_sql_should_be_enabled_for_unprotected_sql_managed_instances_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: dp2_azure_defender_for_storage_should_be_enabled_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: dp3_api_app_should_only_be_accessible_over_https_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: dp3_ftps_only_should_be_required_in_your_function_app_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: dp3_function_app_should_only_be_accessible_over_https_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: dp3_kubernetes_clusters_should_be_accessible_only_over_https_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: dp3_windows_web_servers_should_be_configured_to_use_secure_communication_protocols_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: dp4_automation_account_variables_should_be_encrypted_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: dp4_service_fabric_clusters_should_have_the_clusterprotectionlevel_property_set_to_encryptandsign_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: dp4_transparent_data_encryption_on_sql_databases_should_be_enabled_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: dp4_virtual_machines_should_encrypt_temp_disks__caches__and_data_flows_between_compute_and_storage_resources_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: dp5_azure_cosmos_db_accounts_should_use_customer_managed_keys_to_encrypt_data_at_rest_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: dp5_azure_machine_learning_workspaces_should_be_encrypted_with_a_customer_managed_key_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: dp5_container_registries_should_be_encrypted_with_a_customer_managed_key_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: dp5_mysql_servers_should_use_customer_managed_keys_to_encrypt_data_at_rest_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: dp5_storage_accounts_should_use_customer_managed_key_for_encryption_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: dp6_key_vault_keys_should_have_an_expiration_date_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: dp6_key_vault_secrets_should_have_an_expiration_date_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: dp7_certificates_should_have_the_specified_maximum_validity_period_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: dp8_azure_defender_for_key_vault_should_be_enabled_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: dp8_azure_key_vault_should_disable_public_network_access_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: dp8_key_vaults_should_have_purge_protection_enabled_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: dp8_key_vaults_should_have_soft_delete_enabled_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: dp8_resource_logs_in_key_vault_should_be_enabled_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: es1_azure_defender_for_servers_should_be_enabled_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: es2_endpoint_protection_health_issues_should_be_resolved_on_your_machines_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: es2_endpoint_protection_should_be_installed_on_your_machines_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: es2_endpoint_protection_solution_should_be_installed_on_virtual_machine_scale_sets_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: es2_windows_defender_exploit_guard_should_be_enabled_on_your_machines_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: es3_endpoint_protection_health_issues_should_be_resolved_on_your_machines_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: im1_an_azure_active_directory_administrator_should_be_provisioned_for_sql_servers_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: im1_service_fabric_clusters_should_only_use_azure_active_directory_for_client_authentication_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: im3_managed_identity_should_be_used_in_your_api_app_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: im3_managed_identity_should_be_used_in_your_function_app_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: im3_managed_identity_should_be_used_in_your_web_app_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: im3_virtual_machines_guest_configuration_extension_should_be_deployed_with_system_assigned_managed_identity_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: im6_authentication_to_linux_machines_should_require_ssh_keys_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: im6_mfa_should_be_enabled_accounts_with_write_permissions_on_your_subscription_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: im6_mfa_should_be_enabled_on_accounts_with_owner_permissions_on_your_subscription_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: im6_mfa_should_be_enabled_on_accounts_with_read_permissions_on_your_subscription_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: ir2_email_notification_for_high_severity_alerts_should_be_enabled_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: ir2_email_notification_to_subscription_owner_for_high_severity_alerts_should_be_enabled_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: ir2_subscriptions_should_have_a_contact_email_address_for_security_issues_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: ir3_azure_defender_for_dns_should_be_enabled_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: ir3_azure_defender_for_key_vault_should_be_enabled_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: ir3_azure_defender_for_open_source_relational_databases_should_be_enabled_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: ir3_azure_defender_for_resource_manager_should_be_enabled_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: ir3_azure_defender_for_sql_should_be_enabled_for_unprotected_sql_managed_instances_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: ir4_network_watcher_should_be_enabled_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: ir5_azure_defender_for_dns_should_be_enabled_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: ir5_azure_defender_for_key_vault_should_be_enabled_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: ir5_azure_defender_for_open_source_relational_databases_should_be_enabled_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: ir5_azure_defender_for_resource_manager_should_be_enabled_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: ir5_azure_defender_for_sql_should_be_enabled_for_unprotected_sql_managed_instances_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: lt1_azure_defender_for_dns_should_be_enabled_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: lt1_azure_defender_for_key_vault_should_be_enabled_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: lt1_azure_defender_for_open_source_relational_databases_should_be_enabled_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: lt1_azure_defender_for_resource_manager_should_be_enabled_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: lt1_azure_defender_for_sql_should_be_enabled_for_unprotected_sql_managed_instances_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: lt2_azure_defender_for_dns_should_be_enabled_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: lt2_azure_defender_for_key_vault_should_be_enabled_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: lt2_azure_defender_for_open_source_relational_databases_should_be_enabled_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: lt2_azure_defender_for_resource_manager_should_be_enabled_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: lt2_azure_defender_for_sql_should_be_enabled_for_unprotected_sql_managed_instances_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: lt3_resource_logs_in_azure_data_lake_store_should_be_enabled_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: lt3_resource_logs_in_azure_stream_analytics_should_be_enabled_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: lt3_resource_logs_in_data_lake_analytics_should_be_enabled_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: lt3_resource_logs_in_search_services_should_be_enabled_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: lt3_resource_logs_in_service_bus_should_be_enabled_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: lt5_auto_provisioning_of_the_log_analytics_agent_should_be_enabled_on_your_subscription_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: lt5_linux_machines_should_have_log_analytics_agent_installed_on_azure_arc_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: lt5_log_analytics_agent_should_be_installed_on_your_virtual_machine_for_azure_security_center_monitoring_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: lt5_log_analytics_agent_should_be_installed_on_your_virtual_machine_scale_sets_for_azure_security_center_monitoring_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: lt5_windows_machines_should_have_log_analytics_agent_installed_on_azure_arc_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: lt6_sql_servers_with_auditing_to_storage_account_destination_should_be_configured_with_90_days_retention_or_higher_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: ns10_azure_defender_for_dns_should_be_enabled_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: ns1_adaptive_network_hardening_recommendations_should_be_applied_on_internet_facing_virtual_machines_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: ns1_all_network_ports_should_be_restricted_on_network_security_groups_associated_to_your_virtual_machine_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: ns1_internet_facing_virtual_machines_should_be_protected_with_network_security_groups_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: ns1_non_internet_facing_virtual_machines_should_be_protected_with_network_security_groups_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: ns1_subnets_should_be_associated_with_a_network_security_group_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: ns2_cognitive_services_accounts_should_restrict_network_access_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: ns2_storage_accounts_should_restrict_network_access_using_virtual_network_rules_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: ns2_storage_accounts_should_use_private_link_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: ns2_storage_account_public_access_should_be_disallowed_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: ns2_vm_image_builder_templates_should_use_private_link_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: ns3_all_internet_traffic_should_be_routed_via_your_deployed_azure_firewall_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: ns3_ip_forwarding_on_your_virtual_machine_should_be_disabled_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: ns3_management_ports_of_virtual_machines_should_be_protected_with_just_in_time_network_access_control_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: ns3_management_ports_should_be_closed_on_your_virtual_machines_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: ns5_azure_ddos_protection_standard_should_be_enabled_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: ns6_azure_web_application_firewall_should_be_enabled_for_azure_front_door_entry_points_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: ns6_web_application_firewall_waf_should_be_enabled_for_application_gateway_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: ns7_adaptive_network_hardening_recommendations_should_be_applied_on_internet_facing_virtual_machines_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: ns8_latest_tls_version_should_be_used_in_your_api_app_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: ns8_latest_tls_version_should_be_used_in_your_function_app_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: ns8_latest_tls_version_should_be_used_in_your_web_app_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: pa1_a_maximum_of_3_owners_should_be_designated_for_your_subscription_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: pa1_deprecated_accounts_with_owner_permissions_should_be_removed_from_your_subscription_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: pa1_external_accounts_with_owner_permissions_should_be_removed_from_your_subscription_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: pa1_there_should_be_more_than_one_owner_assigned_to_your_subscription_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: pa2_management_ports_of_virtual_machines_should_be_protected_with_just_in_time_network_access_control_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: pa4_deprecated_accounts_should_be_removed_from_your_subscription_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: pa4_deprecated_accounts_with_owner_permissions_should_be_removed_from_your_subscription_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: pa4_external_accounts_with_owner_permissions_should_be_removed_from_your_subscription_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: pa4_external_accounts_with_read_permissions_should_be_removed_from_your_subscription_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: pa4_external_accounts_with_write_permissions_should_be_removed_from_your_subscription_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: pa7_role_based_access_control_rbac_should_be_used_on_kubernetes_services_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: pv2_cors_should_not_allow_every_resource_to_access_your_api_app_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: pv2_cors_should_not_allow_every_resource_to_access_your_web_applications_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: pv2_kubernetes_clusters_should_not_use_the_default_namespace_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: pv2_kubernetes_cluster_pods_should_only_use_approved_host_network_and_port_range_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: pv2_kubernetes_cluster_pod_hostpath_volumes_should_only_use_allowed_host_paths_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: pv4_guest_attestation_extension_should_be_installed_on_supported_linux_virtual_machines_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: pv4_guest_attestation_extension_should_be_installed_on_supported_linux_virtual_machines_scale_sets_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: pv4_guest_attestation_extension_should_be_installed_on_supported_windows_virtual_machines_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: pv4_vtpm_should_be_enabled_on_supported_virtual_machines_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: pv4_windows_machines_should_meet_requirements_of_the_azure_compute_security_baseline_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: pv5_a_vulnerability_assessment_solution_should_be_enabled_on_your_virtual_machines_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: pv5_vulnerability_assessment_should_be_enabled_on_sql_managed_instance_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: pv5_vulnerability_assessment_should_be_enabled_on_your_sql_servers_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: pv6_container_registry_images_should_have_vulnerability_findings_resolved_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: pv6_ensure_that_java_version_is_the_latest__if_used_as_a_part_of_the_function_app_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: pv6_ensure_that_python_version_is_the_latest__if_used_as_a_part_of_the_api_app_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: pv6_ensure_that_python_version_is_the_latest__if_used_as_a_part_of_the_web_app_policy.outputs.policyId
        parameters: {}
      }
      {
        policyDefinitionId: pv6_sql_servers_on_machines_should_have_vulnerability_findings_resolved_policy.outputs.policyId
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
