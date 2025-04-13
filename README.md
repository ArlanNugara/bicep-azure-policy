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

# Resources Deployed

This project mainly focussed on deploying Azure Virtual Machine Extensions, Built-In and Custom Policy using Bicep including Management Groups and Subscription Placement. The Policy deploys the Extensions in both Windows and Linux systems. Remediation Tasks only works for **DeployIfNotExists** Policy. Existing systems does not automatically remediate, but is remediated using  Policy Remediation Task. Any new system will automatically have the Extensions installed after deployment. 

Here's the list of VM Extensions being deployed using this IaC code.

- **VM Insights with Azure Monitoring Agent and Data Collection Rule**
- **VM Dependency Agent**
- **VM Microsoft Defender for Endpoint**
- **VM Insights with Azure Monitoring Agent and Data Collection Rule for Azure ARC VM**
- **VM Insights with Azure Monitoring Agent and Data Collection Rule for Azure VM**
- **VM Guest Config**
- **VM Iaas Antimalware**

Here's the List of all other Policy that are deployed.

- **Azure Security Benchmark**  
- **CIS Microsoft Azure Foundations Benchmark**  
- **Compute Governance**  
- **Deploy Diagnostics Settings for Storage Accounts to Log Analytics Workspace**  
- **Deploy Diagnostics Settings for Supported Resources to Log Analytics Workspace**  
- **Deploy Service Health Alert Policy**  
- **General Governance**  
- **MySQL Governance**  
- **Network Governance**  
- **NIST SP 800-53 R5**  
- **Tags Governance**  
- **PostgreSQL Governance**  
- **SQL Governance**  
- **Storage Governance**  

Here are the currently supported OS versions for VM extensions : -

|Publisher  | SKU | Status |
|:--| :--: | :--: |
|Ubuntu | 16.04 | Supported |
|Ubuntu | 18.04 | Supported |
|Ubuntu | 20.04 | Supported |
|Ubuntu | 22.04 | Supported |
|Ubuntu | 24.04 | Not Supported Yet |
|RHEL | 7*  | Supported |
|RHEL | 8*  | **Partially Supported** |
|RHEL | 9*  | Not Supported Yet |
|Windows  | 2016  | Supported |
|Windows  | 2019  | Supported |
|Windows  | 2022  | Supported |
|Windows  | 10  | Supported |


# Prerequisites

## Service Connection

Azure DevOps Pipeline requires Service Connection to run tasks. Please refer to this [official article](https://learn.microsoft.com/en-us/azure/devops/pipelines/library/service-endpoints?view=azure-devops&tabs=yaml#create-a-service-connection) for creating the Service Connection from a Service Principle. Note the following values for a Service Principle from Azure Portal.

|Key Name|Value|
|:--|:--|
|ARM-CLIENT-ID|Application ID of the Service Principle|
|ARM-CLIENT-SECRET|Client Secret of the Service Principle|
|ARM-SUBSCRIPTION-ID|Subscription ID of the Key Vault|
|ARM-TENANT-ID|Azure Tenant ID|

# Going through the Bicep code

The code is simplified to granular level for ease of maintenance and understanding. You may change values as per your convenience.

|Name|Function|
|:--|:--|
|.pipelines| Contains Azure DevOps Pipeline YAMLs|
|azresources| Contains Modules for Resources|
|config| Contains Bicepparam files|
|deployment| Contains Bicep files|
|commonParameters.json| Contains Global Variables|

## Update values in bicepparam file

You might need to update the values in **config/** files. Update the values as per your organization's requirement.

## Updating Pipeline YAML file with values

Once done with all the [above steps](#prerequisites) update the **cd-template.yaml** file inside **.pipelines** folder in the repository and update the **cd.yaml** file with your Azure DevOps repository details

```
parameters:
  serviceConnection: '<Your Service Connection Name Here>'
```

```
resources:
  repositories:
    - repository: templates
      type: git
      name: <Your Azure DevOps Project Name Here>/<Your Azure DevOps Repository Name Here>
```

# Run the code

## Creating Deploy Pipeline

Please follow this instruction to create the deploy pipeline

- Go to **Pipelines** in Azure DevOps
- Click on **New Pipeline** from right top corner
- Select **Azure Repos Git**
- Select your repository containing this code
- Select **Existing Azure Pipelines YAML file**
- Select the branch and select path as **/.pipelines/cd.yaml**
- Click on **Continue**
- Click on **Save** from **Run** drop down menu on top right corner
- You may rename the pipeline by choosing **Rename/move** from top right corner Kebab menu

## Running the Deploy Pipeline

Please follow the instruction to run deploy pipelines

- Go to **Pipelines** in Azure DevOps and select the [pipeline](#creating-deploy-pipeline) created above.

- Click on **Run Pipeline** from top right corner

- Select appropriate options or select All and then click on **Run** button.

- Follow the Pipeline Status
