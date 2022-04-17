targetScope = 'subscription'

param policyInputData object
param client string
output policyId string = ns6_web_application_firewall_waf_should_be_enabled_for_application_gateway_policy.id

resource ns6_web_application_firewall_waf_should_be_enabled_for_application_gateway_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-'
  properties: {
    displayName: '${client}-'
    policyType: 'Custom'
    mode: 'All'
    description: 'Deploy Azure Web Application Firewall (WAF) in front of public facing web applications for additional inspection of incoming traffic. Web Application Firewall (WAF) provides centralized protection of your web applications from common exploits and vulnerabilities such as SQL injections, Cross-Site Scripting, local and remote file executions. You can also restrict access to your web applications by countries, IP address ranges, and other http(s) parameters via custom rules.'
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
            equals: 'Microsoft.Network/applicationGateways'
          }
          {
            field: 'Microsoft.Network/applicationGateways/webApplicationFirewallConfiguration'
            exists: 'false'
          }
          {
            field: 'Microsoft.Network/applicationGateways/firewallPolicy'
            exists: 'false'
          }
        ]
      }
      then: {
        effect: 'Audit'
      }
    }
  }
}
