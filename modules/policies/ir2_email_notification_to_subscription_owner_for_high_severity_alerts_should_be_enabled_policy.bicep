targetScope = 'subscription'

param policyInputData object
param client string
output policyId string = ir2_email_notification_to_subscription_owner_for_high_severity_alerts_should_be_enabled_policy.id

resource ir2_email_notification_to_subscription_owner_for_high_severity_alerts_should_be_enabled_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-'
  properties: {
    displayName: '${client}-'
    policyType: 'Custom'
    mode: 'All'
    description: 'To ensure your subscription owners are notified when there is a potential security breach in their subscription, set email notifications to subscription owners for high severity alerts in Security Center.'
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
        field: 'type'
        equals: 'Microsoft.Resources/subscriptions'
      }
      then: {
        effect: 'AuditIfNotExists'
        details: {
          type: 'Microsoft.Security/securityContacts'
          existenceScope: 'subscription'
          existenceCondition: {
            not: {
              allOf: [
                {
                  field: 'Microsoft.Security/securityContacts/alertsToAdmins'
                  equals: 'Off'
                }
                {
                  field: 'Microsoft.Security/securityContacts/alertNotifications.minimalSeverity'
                  equals: 'High'
                }
              ]
            }
          }
        }
      }
    }
  }
}
