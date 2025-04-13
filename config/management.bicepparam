using '../deployment/management.bicep'

param managementSubscriptionId = readEnvironmentVariable('MANAGEMENT_SUBSCRIPTION_ID')

param managementRg = {
  name: 'rg-mgmt-shared-ce-01'
  location: 'canadaeast'
}

param workspaces = {
  name: 'log-mgmt-shared-ce-01'
}

param dce = {
  name : 'dce-mgmt-shared-ce-01'
}

param dcrs = [
  {
    name: 'dcr-vminsights-shared-ce-01'
    dataFlow: [
      {
        streams: [
          'Microsoft-InsightsMetrics'
        ]
        destinations: [
          'dcr-vminsights-shared-ce-01-log'
        ]
      }
      {
        streams: [
          'Microsoft-Perf'
        ]
        destinations: [
          'dcr-vminsights-shared-ce-01-log'
        ]
      }
      {
        streams: [
          'Microsoft-ServiceMap'
        ]
        destinations: [
          'dcr-vminsights-shared-ce-01-log'
        ]
      }
    ]
    dataSource: {
      performanceCounters: [
        {
          counterSpecifiers: [
            '\\VmInsights\\DetailedMetrics'
          ]
          name: 'VMInsightsPerfCounters'
          samplingFrequencyInSeconds: 60
          streams: [
            'Microsoft-InsightsMetrics'
          ]
        }
      ]
      windowsEventLogs: [
        {
          name: 'eventLogsDataSource'
          streams: [
            'Microsoft-Event'
          ]
          xPathQueries: [
            'Application!*[System[(Level=1 or Level=2 or Level=3)]]'
            'Security!*[System[(band(Keywords,4503599627370496))]]'
            'System!*[System[(Level=1 or Level=2 or Level=3)]]'
          ]
        }
      ]
      syslog: [
        {
          facilityNames: [
            'syslog'
          ]
          logLevels: [
            'Critical'
            'Alert'
            'Emergency'
          ]
          name: 'sysLogsDataSource'
          streams: [
            'Microsoft-Syslog'
          ]
        }
      ]
      extensions: [
        {
          extensionName: 'DependencyAgent'
          name: 'DependencyAgentDataSource'
          streams: [
            'Microsoft-ServiceMap'
          ]
        }
      ]
    }
  }
  {
    name: 'dcr-changetracking-shared-ce-01'
    dataFlow: [
      {
        streams: [
          'Microsoft-ConfigurationChange'
          'Microsoft-ConfigurationChangeV2'
          'Microsoft-ConfigurationData'
        ]
        destinations: [
          'dcr-changetracking-shared-ce-01-log'
        ]
      }
    ]
    dataSource: {
      extensions: [
        {
          streams: [
            'Microsoft-ConfigurationChange'
            'Microsoft-ConfigurationChangeV2'
            'Microsoft-ConfigurationData'
          ]
          extensionName: 'ChangeTracking-Windows'
          extensionSettings: {
            enableFiles: true
            enableSoftware: true
            enableRegistry: true
            enableServices: true
            enableInventory: true
            registrySettings: {
              registryCollectionFrequency: 3000
              registryInfo: [
                {
                  name: 'Registry_1'
                  groupTag: 'Recommended'
                  enabled: false
                  recurse: true
                  description: ''
                  keyName: 'HKEY_LOCAL_MACHINE\\Software\\Microsoft\\Windows\\CurrentVersion\\Group Policy\\Scripts\\Startup'
                  valueName: ''
                }
                {
                    name: 'Registry_2'
                    groupTag: 'Recommended'
                    enabled: false
                    recurse: true
                    description: ''
                    keyName: 'HKEY_LOCAL_MACHINE\\Software\\Microsoft\\Windows\\CurrentVersion\\Group Policy\\Scripts\\Shutdown'
                    valueName: ''
                }
                {
                    name: 'Registry_3'
                    groupTag: 'Recommended'
                    enabled: false
                    recurse: true
                    description: ''
                    keyName: 'HKEY_LOCAL_MACHINE\\SOFTWARE\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Run'
                    valueName: ''
                }
                {
                    name: 'Registry_4'
                    groupTag: 'Recommended'
                    enabled: false
                    recurse: true
                    description: ''
                    keyName: 'HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Active Setup\\Installed Components'
                    valueName: ''
                }
                {
                    name: 'Registry_5'
                    groupTag: 'Recommended'
                    enabled: false
                    recurse: true
                    description: ''
                    keyName: 'HKEY_LOCAL_MACHINE\\Software\\Classes\\Directory\\ShellEx\\ContextMenuHandlers'
                    valueName: ''
                }
                {
                    name: 'Registry_6'
                    groupTag: 'Recommended'
                    enabled: false
                    recurse: true
                    description: ''
                    keyName: 'HKEY_LOCAL_MACHINE\\Software\\Classes\\Directory\\Background\\ShellEx\\ContextMenuHandlers'
                    valueName: ''
                }
                {
                    name: 'Registry_7'
                    groupTag: 'Recommended'
                    enabled: false
                    recurse: true
                    description: ''
                    keyName: 'HKEY_LOCAL_MACHINE\\Software\\Classes\\Directory\\Shellex\\CopyHookHandlers'
                    valueName: ''
                }
                {
                    name: 'Registry_8'
                    groupTag: 'Recommended'
                    enabled: false
                    recurse: true
                    description: ''
                    keyName: 'HKEY_LOCAL_MACHINE\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\ShellIconOverlayIdentifiers'
                    valueName: ''
                }
                {
                    name: 'Registry_9'
                    groupTag: 'Recommended'
                    enabled: false
                    recurse: true
                    description: ''
                    keyName: 'HKEY_LOCAL_MACHINE\\Software\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Explorer\\ShellIconOverlayIdentifiers'
                    valueName: ''
                }
                {
                    name: 'Registry_10'
                    groupTag: 'Recommended'
                    enabled: false
                    recurse: true
                    description: ''
                    keyName: 'HKEY_LOCAL_MACHINE\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Browser Helper Objects'
                    valueName: ''
                }
                {
                    name: 'Registry_11'
                    groupTag: 'Recommended'
                    enabled: false
                    recurse: true
                    description: ''
                    keyName: 'HKEY_LOCAL_MACHINE\\Software\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Browser Helper Objects'
                    valueName: ''
                }
                {
                    name: 'Registry_12'
                    groupTag: 'Recommended'
                    enabled: false
                    recurse: true
                    description: ''
                    keyName: 'HKEY_LOCAL_MACHINE\\Software\\Microsoft\\Internet Explorer\\Extensions'
                    valueName: ''
                }
                {
                    name: 'Registry_13'
                    groupTag: 'Recommended'
                    enabled: false
                    recurse: true
                    description: ''
                    keyName: 'HKEY_LOCAL_MACHINE\\Software\\Wow6432Node\\Microsoft\\Internet Explorer\\Extensions'
                    valueName: ''
                }
                {
                    name: 'Registry_14'
                    groupTag: 'Recommended'
                    enabled: false
                    recurse: true
                    description: ''
                    keyName: 'HKEY_LOCAL_MACHINE\\Software\\Microsoft\\Windows NT\\CurrentVersion\\Drivers32'
                    valueName: ''
                }
                {
                    name: 'Registry_15'
                    groupTag: 'Recommended'
                    enabled: false
                    recurse: true
                    description: ''
                    keyName: 'HKEY_LOCAL_MACHINE\\Software\\Wow6432Node\\Microsoft\\Windows NT\\CurrentVersion\\Drivers32'
                    valueName: ''
                }
                {
                    name: 'Registry_16'
                    groupTag: 'Recommended'
                    enabled: false
                    recurse: true
                    description: ''
                    keyName: 'HKEY_LOCAL_MACHINE\\System\\CurrentControlSet\\Control\\Session Manager\\KnownDlls'
                    valueName: ''
                }
                {
                    name: 'Registry_17'
                    groupTag: 'Recommended'
                    enabled: false
                    recurse: true
                    description: ''
                    keyName: 'HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Winlogon\\Notify'
                    valueName: ''
                }
              ]
            }
            fileSettings: {
              fileCollectionFrequency: 2700
            }
            softwareSettings: {
              softwareCollectionFrequency: 1800
            }
            inventorySettings: {
              inventoryCollectionFrequency: 36000
            }
            serviceSettings: {
              serviceCollectionFrequency: 1800
            }
          }
          name: 'CTDataSource-Windows'
        }
        {
          streams: [
            'Microsoft-ConfigurationChange'
            'Microsoft-ConfigurationChangeV2'
            'Microsoft-ConfigurationData'
          ]
          extensionName: 'ChangeTracking-Linux'
          extensionSettings: {
            enableFiles: true
            enableSoftware: true
            enableRegistry: false
            enableServices: true
            enableInventory: true
            fileSettings: {
              fileCollectionFrequency: 900
              fileInfo: [
                {
                  name: 'ChangeTrackingLinuxPath_default'
                  enabled: true
                  destinationPath: '/etc/.*.conf'
                  useSudo: true
                  recurse: true
                  maxContentsReturnable: 5000000
                  pathType: 'File'
                  type: 'File'
                  links: 'Follow'
                  maxOutputSize: 500000
                  groupTag: 'Recommended'
                }
              ]
            }
            softwareSettings: {
              softwareCollectionFrequency: 300
            }
            inventorySettings: {
              inventoryCollectionFrequency: 36000
            }
            serviceSettings: {
              serviceCollectionFrequency: 300
            }
          }
          name: 'CTDataSource-Linux'
        }
      ]
    }
  }
]

param aas = {
  name: 'aa-mgmt-shared-ce-01'
  sku: 'Basic'
}

param subMonitorLogsCategory = [
  {
    category: 'Administrative'
    enabled: true
  }
  {
    category: 'Security'
    enabled: true
  }
  {
    category: 'ServiceHealth'
    enabled: true
  }
  {
    category: 'Alert'
    enabled: true
  }
  {
    category: 'Recommendation'
    enabled: true
  }
  {
    category: 'Policy'
    enabled: true
  }
  {
    category: 'Autoscale'
    enabled: true
  }
  {
    category: 'ResourceHealth'
    enabled: true
  }
]

param defaultTags = {
  Department: 'IT'
  Owner: 'Arlan Nugara'
  Environment: 'Shared'
}
