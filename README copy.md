# Introduction

This repository contains Azure Security Policies created and maintained using Bicep. There are currently 30 definition in this repository. All the policy definition is attached to a single policy set definition which is assigned to a single initiative at Management Group Level.

## List of Policy Definitions

1. Optional Tags
2. Diagnostic Logs send to log analytics workspace
3. Diagnostic settings
4. Mandatory Tags
5. VM Extension Types
6. NSG all allowed rules
7. VM Encryption
8. Allowed Resource Types
9. Allowed Azure Region
10. Allowed SQL Version
11. Allowed VM SKU Types
12. Allowed Subnets for Public IP
13. Allowed VM OS version
14. NSG for every Subnet
15. HTTPS enabled storage transfers
16. Enable Network Watchers
17. Azure Firewall for Internet Traffic
18. Enable DDOS
19. VM IP Forwarding
20. VM Managed Port Access
21. VM with NSG for Internet Facing
22. VM Managed Disk
23. Storage Account Network Access
24. Storage Account Key Expiry
25. SQL Server Network Access
26. SQL Database TLS version
27. SQL Database Private Endpoint
28. Key Vault Soft Delete
29. Key Vault Purge Protection
30. Allowed Storage Account SKUs

## Operations details

The Bicep project is configured to work on the following principle

The **main.bicep** triggeres the **modules/policy.bicep** which calls each modules from **modules/policies**
 directory- The parameters file named **main.parameters.json** feeds the modules with defined values.

### Authenticate Azure CLI

Hit the command **az login** from Comamnd Prompt or Terminal depending upon your OS. More details can be found [here](https://docs.microsoft.com/en-us/cli/azure/get-started-with-azure-cli)

### Trigger Manually

Fire the below command to create the resources using Bicep script. PLease change names as per convenience.

> az deployment sub create --location Canada --name PolicyDeployment1 --template-file main.bicep --parameters main.parameters.json