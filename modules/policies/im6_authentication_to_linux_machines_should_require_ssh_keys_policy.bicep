targetScope = 'subscription'

param client string
output policyId string = im6_authentication_to_linux_machines_should_require_ssh_keys_policy.id
resource im6_authentication_to_linux_machines_should_require_ssh_keys_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-Authentication to Linux machines should require SSH keys'
  properties: {
    displayName: '${client}-Authentication to Linux machines should require SSH keys'
    policyType: 'Custom'
    mode: 'Indexed'
    description: 'Although SSH itself provides an encrypted connection, using passwords with SSH still leaves the VM vulnerable to brute-force attacks. The most secure option for authenticating to an Azure Linux virtual machine over SSH is with a public-private key pair, also known as SSH keys. Learn more: https://docs.microsoft.com/azure/virtual-machines/linux/create-ssh-keys-detailed.'
    metadata: {
      category: 'Guest Configuration'
      version: '3.0.0'
      requiredProviders: [
        'Microsoft.GuestConfiguration'
      ]
      guestConfiguration: {
        name: 'LinuxNoPasswordForSSH'
        version: '1.*'
      }
    }
    parameters: {
      IncludeArcMachines: {
        type: 'String'
        metadata: {
          displayName: 'Include Arc connected servers'
          description: 'By selecting this option, you agree to be charged monthly per Arc connected machine.'
          portalReview: 'true'
        }
        allowedValues: [
          'true'
          'false'
        ]
        defaultValue: 'false'
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
                anyOf: [
                  {
                    field: 'Microsoft.Compute/imagePublisher'
                    in: [
                      'microsoft-aks'
                      'qubole-inc'
                      'datastax'
                      'couchbase'
                      'scalegrid'
                      'checkpoint'
                      'paloaltonetworks'
                      'debian'
                    ]
                  }
                  {
                    allOf: [
                      {
                        field: 'Microsoft.Compute/imagePublisher'
                        equals: 'OpenLogic'
                      }
                      {
                        field: 'Microsoft.Compute/imageOffer'
                        like: 'CentOS*'
                      }
                      {
                        field: 'Microsoft.Compute/imageSKU'
                        notLike: '6*'
                      }
                    ]
                  }
                  {
                    allOf: [
                      {
                        field: 'Microsoft.Compute/imagePublisher'
                        equals: 'Oracle'
                      }
                      {
                        field: 'Microsoft.Compute/imageOffer'
                        equals: 'Oracle-Linux'
                      }
                      {
                        field: 'Microsoft.Compute/imageSKU'
                        notLike: '6*'
                      }
                    ]
                  }
                  {
                    allOf: [
                      {
                        field: 'Microsoft.Compute/imagePublisher'
                        equals: 'RedHat'
                      }
                      {
                        field: 'Microsoft.Compute/imageOffer'
                        in: [
                          'RHEL'
                          'RHEL-HA'
                          'RHEL-SAP'
                          'RHEL-SAP-APPS'
                          'RHEL-SAP-HA'
                          'RHEL-SAP-HANA'
                        ]
                      }
                      {
                        field: 'Microsoft.Compute/imageSKU'
                        notLike: '6*'
                      }
                    ]
                  }
                  {
                    allOf: [
                      {
                        field: 'Microsoft.Compute/imagePublisher'
                        equals: 'RedHat'
                      }
                      {
                        field: 'Microsoft.Compute/imageOffer'
                        in: [
                          'osa'
                          'rhel-byos'
                        ]
                      }
                    ]
                  }
                  {
                    allOf: [
                      {
                        field: 'Microsoft.Compute/imagePublisher'
                        equals: 'center-for-internet-security-inc'
                      }
                      {
                        field: 'Microsoft.Compute/imageOffer'
                        in: [
                          'cis-centos-7-l1'
                          'cis-centos-7-v2-1-1-l1'
                          'cis-centos-8-l1'
                          'cis-debian-linux-8-l1'
                          'cis-debian-linux-9-l1'
                          'cis-nginx-centos-7-v1-1-0-l1'
                          'cis-oracle-linux-7-v2-0-0-l1'
                          'cis-oracle-linux-8-l1'
                          'cis-postgresql-11-centos-linux-7-level-1'
                          'cis-rhel-7-l2'
                          'cis-rhel-7-v2-2-0-l1'
                          'cis-rhel-8-l1'
                          'cis-suse-linux-12-v2-0-0-l1'
                          'cis-ubuntu-linux-1604-v1-0-0-l1'
                          'cis-ubuntu-linux-1804-l1'
                        ]
                      }
                    ]
                  }
                  {
                    allOf: [
                      {
                        field: 'Microsoft.Compute/imagePublisher'
                        equals: 'credativ'
                      }
                      {
                        field: 'Microsoft.Compute/imageOffer'
                        equals: 'Debian'
                      }
                      {
                        field: 'Microsoft.Compute/imageSKU'
                        notLike: '7*'
                      }
                    ]
                  }
                  {
                    allOf: [
                      {
                        field: 'Microsoft.Compute/imagePublisher'
                        equals: 'Suse'
                      }
                      {
                        field: 'Microsoft.Compute/imageOffer'
                        like: 'SLES*'
                      }
                      {
                        field: 'Microsoft.Compute/imageSKU'
                        notLike: '11*'
                      }
                    ]
                  }
                  {
                    allOf: [
                      {
                        field: 'Microsoft.Compute/imagePublisher'
                        equals: 'Canonical'
                      }
                      {
                        field: 'Microsoft.Compute/imageOffer'
                        contains: 'Ubuntu'
                      }
                      {
                        field: 'Microsoft.Compute/imageSKU'
                        notLike: '12*'
                      }
                    ]
                  }
                  {
                    allOf: [
                      {
                        field: 'Microsoft.Compute/imagePublisher'
                        equals: 'microsoft-dsvm'
                      }
                      {
                        field: 'Microsoft.Compute/imageOffer'
                        in: [
                          'linux-data-science-vm-ubuntu'
                          'azureml'
                          'ubuntu-hpc'
                          'ubuntu-1804'
                        ]
                      }
                    ]
                  }
                  {
                    allOf: [
                      {
                        field: 'Microsoft.Compute/imagePublisher'
                        equals: 'cloudera'
                      }
                      {
                        field: 'Microsoft.Compute/imageOffer'
                        equals: 'cloudera-centos-os'
                      }
                      {
                        field: 'Microsoft.Compute/imageSKU'
                        notLike: '6*'
                      }
                    ]
                  }
                  {
                    allOf: [
                      {
                        field: 'Microsoft.Compute/imagePublisher'
                        equals: 'cloudera'
                      }
                      {
                        field: 'Microsoft.Compute/imageOffer'
                        equals: 'cloudera-altus-centos-os'
                      }
                    ]
                  }
                  {
                    allOf: [
                      {
                        field: 'Microsoft.Compute/imagePublisher'
                        equals: 'microsoft-ads'
                      }
                      {
                        field: 'Microsoft.Compute/imageOffer'
                        like: 'linux*'
                      }
                    ]
                  }
                  {
                    allOf: [
                      {
                        anyOf: [
                          {
                            field: 'Microsoft.Compute/virtualMachines/osProfile.linuxConfiguration'
                            exists: 'true'
                          }
                          {
                            field: 'Microsoft.Compute/virtualMachines/storageProfile.osDisk.osType'
                            like: 'Linux*'
                          }
                        ]
                      }
                      {
                        anyOf: [
                          {
                            field: 'Microsoft.Compute/imagePublisher'
                            exists: 'false'
                          }
                          {
                            field: 'Microsoft.Compute/imagePublisher'
                            notIn: [
                              'OpenLogic'
                              'RedHat'
                              'credativ'
                              'Suse'
                              'Canonical'
                              'microsoft-dsvm'
                              'cloudera'
                              'microsoft-ads'
                              'center-for-internet-security-inc'
                              'Oracle'
                              'AzureDatabricks'
                              'azureopenshift'
                            ]
                          }
                        ]
                      }
                    ]
                  }
                ]
              }
            ]
          }
          {
            allOf: [
              {
                value: '[parameters(\'IncludeArcMachines\')]'
                equals: 'true'
              }
              {
                anyOf: [
                  {
                    allOf: [
                      {
                        field: 'type'
                        equals: 'Microsoft.HybridCompute/machines'
                      }
                      {
                        field: 'Microsoft.HybridCompute/imageOffer'
                        like: 'linux*'
                      }
                    ]
                  }
                  {
                    allOf: [
                      {
                        field: 'type'
                        equals: 'Microsoft.ConnectedVMwarevSphere/virtualMachines'
                      }
                      {
                        field: 'Microsoft.ConnectedVMwarevSphere/virtualMachines/osProfile.osType'
                        like: 'linux*'
                      }
                    ]
                  }
                ]
              }
            ]
          }
        ]
      }
      then: {
        effect: 'AuditIfNotExists'
        details: {
          type: 'Microsoft.GuestConfiguration/guestConfigurationAssignments'
          name: 'LinuxNoPasswordForSSH'
          existenceCondition: {
            field: 'Microsoft.GuestConfiguration/guestConfigurationAssignments/complianceStatus'
            equals: 'Compliant'
          }
        }
      }
    }
  }
}
