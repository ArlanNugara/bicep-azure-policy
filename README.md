# What is Azure Policy ? [As Per Official Microsoft Article](https://docs.microsoft.com/en-us/azure/governance/policy/overview)

Azure Policy helps to enforce organizational standards and to assess compliance at-scale. Through its compliance dashboard, it provides an aggregated view to evaluate the overall state of the environment, with the ability to drill down to the per-resource, per-policy granularity. It also helps to bring your resources to compliance through bulk remediation for existing resources and automatic remediation for new resources.

Common use cases for Azure Policy include implementing governance for resource consistency, regulatory compliance, security, cost, and management. Policy definitions for these common use cases are already available in your Azure environment as built-ins to help you get started.

All Azure Policy data and objects are encrypted at rest.

More information about Azure Policy can be found [here](https://youtu.be/dxMaYF2GB7o) and [here](https://docs.microsoft.com/en-us/azure/governance/policy/overview)

## Overview

Azure Policy evaluates resources in Azure by comparing the properties of those resources to business rules. These business rules, described in JSON format, are known as policy definitions. To simplify management, several business rules can be grouped together to form a policy initiative (sometimes called a policySet). Once your business rules have been formed, the policy definition or initiative is assigned to any scope of resources that Azure supports, such as management groups, subscriptions, resource groups, or individual resources. The assignment applies to all resources within the Resource Manager scope of that assignment. Subscopes can be excluded, if necessary.

Azure Policy uses a JSON format to form the logic the evaluation uses to determine whether a resource is compliant or not. Definitions include metadata and the policy rule. The defined rule can use functions, parameters, logical operators, conditions, and property aliases to match exactly the scenario you want. The policy rule determines which resources in the scope of the assignment get evaluated.

## Understand evaluation outcomes

Resources are evaluated at specific times during the resource lifecycle, the policy assignment lifecycle, and for regular ongoing compliance evaluation. The following are the times or events that cause a resource to be evaluated:

- A resource is created or updated in a scope with a policy assignment.
- A policy or initiative is newly assigned to a scope.
- A policy or initiative already assigned to a scope is updated.
- During the standard compliance evaluation cycle, which occurs once every 24 hours.

## Control the response to an evaluation

Business rules for handling non-compliant resources vary widely between organizations. Examples of how an organization wants the platform to respond to a non-compliant resource include:

- Deny the resource change
- Log the change to the resource
- Alter the resource before the change
- Alter the resource after the change
- Deploy related compliant resources

Azure Policy makes each of these business responses possible through the application of effects. Effects are set in the policy rule portion of the policy definition.

## Remediate non-compliant resources

While these effects primarily affect a resource when the resource is created or updated, Azure Policy also supports dealing with existing non-compliant resources without needing to alter that resource.

## Azure Policy vs Azure RBAC

There are a few key differences between Azure Policy and Azure role-based access control (Azure RBAC). Azure Policy evaluates state by examining properties on resources that are represented in Resource Manager and properties of some Resource Providers. Azure Policy doesn't restrict actions (also called operations). Azure Policy ensures that resource state is compliant to your business rules without concern for who made the change or who has permission to make a change. Some Azure Policy resources, such as policy definitions, initiative definitions, and assignments, are visible to all users. This design enables transparency to all users and services for what policy rules are set in their environment.

Azure RBAC focuses on managing user actions at different scopes. If control of an action is required, then Azure RBAC is the correct tool to use. Even if an individual has access to perform an action, if the result is a non-compliant resource, Azure Policy still blocks the create or update.

The combination of Azure RBAC and Azure Policy provides full scope control in Azure.

## Azure Policy Objects

### Policy definition

The journey of creating and implementing a policy in Azure Policy begins with creating a policy definition. Every policy definition has conditions under which it's enforced. And, it has a defined effect that takes place if the conditions are met.

### Initiative definition

An initiative definition is a collection of policy definitions that are tailored toward achieving a singular overarching goal. Initiative definitions simplify managing and assigning policy definitions. They simplify by grouping a set of policies as one single item. For example, you could create an initiative titled Enable Monitoring in Microsoft Defender for Cloud, with a goal to monitor all the available security recommendations in your Microsoft Defender for Cloud instance.

### Assignments

An assignment is a policy definition or initiative that has been assigned to a specific scope. This scope could range from a management group to an individual resource. The term scope refers to all the resources, resource groups, subscriptions, or management groups that the definition is assigned to. Assignments are inherited by all child resources. This design means that a definition applied to a resource group is also applied to resources in that resource group. However, you can exclude a subscope from the assignment.

# Going through the Bicep code

The Bicep project is configured to work on the following principle

- The **main.bicep** calls the **policy.bicep** file.
- The **policy.bicep** in returns calls the modules in **modules/policies** directory and creates the policies.
- The **main.parameters.json** file is passed to the command which contains all the key value pair of the variables. You need to exchange **"<Your Value Here>"** with your values.

## Understanding Policy code

The **main.bicep** file starts with a **targetScope** variable which defines the deployment scope of the code.

```
targetScope = 'subscription'
```

Then it defines the parameters and their type

```
param policyInitiativeArray array
```

The code is defined to run in loops for the modules defined in **policy.bicep**.

```
module policyM 'modules/policy.bicep' = [for (pol, i) in policyInitiativeArray: {
  name: 'Policy-${i}'
  params: {
    policyData: pol
  }
}]
```

The **policy.bicep** files call the modules. Here's example of calling the module **allowed_regions**

```
module allowedRegionsModule './policies/allowed_regions.bicep' = {
  name: '${policyData.client}-${policyData.allowed_regions_policy.name}'
  params: {
    client: policyData.client
    policyInputData: policyData.allowed_regions_policy
  }
}
```

Now let's check the policy which allows certain regions for resources. Let's do a step by step breakdown of the code. Taking example of **allow_regions.bicep** policy which is called in previous step

The initial settings. You can see we are doing a output for the policy ID which will be used while creating the Policy Set Definition

```
targetScope = 'subscription'

param policyInputData object
param client string
output policyId string = allowed_regions_policy.id
```

The general details of the policy. All values comes from **main.parameter.json** file

```
resource allowed_regions_policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: '${client}-${policyInputData.name}'
  properties: {
    displayName: '${client}-${policyInputData.displayName}'
    policyType: 'Custom'
    mode: 'All'
    description: policyInputData.description
    metadata: {
      category: 'General'
    }
```

The policy rule is defined here. It uses the parameter for **regAllowedRegions** and a variable **policyInputData.effect**

```
policyRule: {
    if: {
      allOf: [
        {
          field: 'location'
          notIn: '[parameters(\'regAllowedRegions\')]'
        }
        {
          field: 'location'
          notEquals: 'global'
        }
        {
          field: 'type'
          notEquals: 'Microsoft.AzureActiveDirectory/b2cDirectories'
        }
      ]
    }
    then: {
      effect: policyInputData.effect
    }
}
```

Now lets go back to **policy.bicep** and attach the policies to a Policy Set Definition. The initial properties have been set. Note the **dependsOn** section

```
resource policyDefSet 'Microsoft.Authorization/policySetDefinitions@2021-06-01' = {
  name: '${policyData.client}-${policyData.name}'
  dependsOn: [
    allowedRegionsModule
    ........truncated..........
  ]
  properties: {
    policyType: policyData.policyType
    displayName: policyData.policySetDefinitionDisplayName
    parameters: {}
    .........trancated........
```

Attaching the policy to a Policy Set Definition. Note the **parameters** are empty as it is already set in the policies.

```
.....trauncated......
policyDefinitions: [
    {
    //#3:allowed_regions_policy
    policyDefinitionId: allowedRegionsModule.outputs.policyId
    parameters: {}
    }
```

Now the last part of the Assignments of the policies. Note that the Policy Set Definiton is used and not individual Policy Definitions.

```
resource policyAssign 'Microsoft.Authorization/policyAssignments@2021-06-01' = {
  name: '${policyData.client}-${policyData.name}-Assignment'
  properties: {
    displayName: '${policyData.client}-${policyData.policyInitiativeDisplayName}'
    enforcementMode: 'Default'
    policyDefinitionId: policyDefSet.id
    parameters: {}
  }
}
```

The parameter file is a simple json file which holds value of all the variables.

```
.......truncated........
"allowed_regions_policy": {
    "name": "Allowed-Azure-Regions",
    "displayName": "Allowed Azure Regions",
    "description": "This policy allows resources to be created in the allowed locations.",
    "listOfAllowedLocations": ["canadaeast", "canadacentral"],
    "effect": "Audit"
    },
........truncated.......
```

# Policies that are created

1. Allowed Regions
2. Allowed Resource Types
3. Allowed SQL Version
4. Allowed Storage Account SKU
5. Allowed VM Extensions
6. Allowed Subnets for Public IP
7. Allowed VM OS and version
8. Allowed VM SKU
9. DDOS Protection
10. Diagnostics Settings
11. Diagnostic settings logs to be send to Log Analytics WOrkspace
12. Firewall Internet Traffic
13. Key Vault Purge Protection
14. Key Vault soft delete
15. VM NIC IP Forwarding
16. Enable Network Watchers
17. NSG for every Subnet
18. NSG Inbound rules
19. SQL Database Private endpoint
20. SQL Database TLS version
21. SQL server public network access
22. Storage Account Secure Transfer Settings
23. Storage Account Key Expiry
24. Storage Account Network Access
25. Mandatory Tags
26. Optional Tags
27. Internet facing VM NSG
28. VM managed disk
29. VM management port
30. VM encryption

# Run the code

## Authenticate Azure CLI

Hit the command **az login** from Comamnd Prompt or Terminal depending upon your OS. More details can be found [here](https://docs.microsoft.com/en-us/cli/azure/get-started-with-azure-cli)

## Trigger Manually

Fire the below command to create the resources using Bicep script

> az deployment sub create --location WestUS --name ExampleDeployment --template-file main.bicep --parameters main.parameters.json