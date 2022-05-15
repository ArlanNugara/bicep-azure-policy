targetScope = 'subscription'

param client string
output policyId string = ns2_cognitive_services_accounts_should_restrict_network_access_policy.id
resource ns2_cognitive_services_accounts_should_restrict_network_access_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-Cognitive Services accounts should restrict network access'
  properties: {
    displayName: '${client}-Cognitive Services accounts should restrict network access'
    policyType: 'Custom'
    mode: 'Indexed'
    description: 'Network access to Cognitive Services accounts should be restricted. Configure network rules so only applications from allowed networks can access the Cognitive Services account. To allow connections from specific internet or on-premises clients, access can be granted to traffic from specific Azure virtual networks or to public internet IP address ranges.'
    metadata: {
      version: '2.0.0'
      category: 'Cognitive Services'
    }
    policyRule: {
      if: {
        allOf: [
          {
            field: 'type'
            equals: 'Microsoft.CognitiveServices/accounts'
          }
          {
            field: 'Microsoft.CognitiveServices/accounts/networkAcls.defaultAction'
            notEquals: 'Deny'
          }
          {
            count: {
              field: 'Microsoft.CognitiveServices/accounts/capabilities[*]'
              where: {
                field: 'Microsoft.CognitiveServices/accounts/capabilities[*].name'
                equals: 'VirtualNetworks'
              }
            }
            greater: 0
          }
        ]
      }
      then: {
        effect: 'Audit'
      }
    }
  }
}
