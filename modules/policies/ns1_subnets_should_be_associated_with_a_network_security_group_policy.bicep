targetScope = 'subscription'

param client string
output policyId string = ns1_subnets_should_be_associated_with_a_network_security_group_policy.id
resource ns1_subnets_should_be_associated_with_a_network_security_group_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-Subnets should be associated with a Network Security Group'
  properties: {
    displayName: '${client}-Subnets should be associated with a Network Security Group'
    policyType: 'Custom'
    mode: 'All'
    description: 'Protect your subnet from potential threats by restricting access to it with a Network Security Group (NSG). NSGs contain a list of Access Control List (ACL) rules that allow or deny network traffic to your subnet.'
    metadata: {
      version: '3.0.0'
      category: 'Security Center'
    }
    policyRule: {
      if: {
        field: 'type'
        equals: 'Microsoft.Network/virtualNetworks/subnets'
      }
      then: {
        effect: 'AuditIfNotExists'
        details: {
          type: 'Microsoft.Security/assessments'
          name: 'eade5b56-eefd-444f-95c8-23f29e5d93cb'
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
