

# Deploying Megaport Between GCP and Private Cloud.

## ISSUE:

- Your organization is now moving to a Hybrid design and going to be
hosting infrastructure between private and public clouds. 
The challenge isthe communication between the clouds is over the internet and restricted on bandwidth, this has to be solved. There are services like **MegaPort** available to solve this problem.

## Approach

- In order to enable megaport connection between our private cloud and GCP we need to first establish a MVE.
- MVE - Megaport Virtual Edge (MVE) is an on-demand, vendor-neutral Network Function Virtualization (NFV) service that enables branch-to-cloud connectivity on Megaport’s global software-defined network (SDN). MVE provides the edge-computing framework that hosts partner software-defined wide area network (SD-WAN) technology directly on Megaport’s global SDN.
- In our case the SD-WAN would be **Fortinet firewall**.
![Final Result](https://docs.megaport.com/mve/img/less-internet.png)

## Strategy



![enter image description here](https://docs.megaport.com/mve/fortinet/img/mve-fortinet-overview.png)

Step 1- Planning Our Deployment.
-
 - We will have to check for Size of our infra to host MVE, Security, Licensing.
 - https://docs.megaport.com/mve/fortinet/plan-deployment/

>     Pre-requisites 
>     There are three parts to adding a Google Cloud connection to your MVE and FortiManager.
>     
>      -  Create a Partner Interconnect attachment in Google Cloud Console.
>         
>      -  In the Megaport Portal, create a VXC from your MVE to connect to your Google Cloud attachment.
>         
>      -  In FortiManager, create a new interface and add the details of the Google Cloud connection.

Step 2 - Creation 
- 
-    Obtain a license from Fortinet.
-   Generate an SSH key pair for authentication.
-   Create the Fortinet MVE in the Megaport Portal.
-   View the MVE public IP address assignment in the Megaport Portal.
-   Set an admin password for the FortiGate.
-   Allow secure console access to the FortiGate.
-   [Steps To Complete the tasks.](https://docs.megaport.com/mve/fortinet/creating-mve/)

Step 3 - Connecting MVE to Fortinet (Private cloud) and GCP
 - 
 - With MVE configured, you can create VXCs to connect to services on the Megaport network without the need for any physical infrastructure. A VXC is essentially a private point-to-point Ethernet connection between an A-End (your MVE) and a B-End (one of the destination types).
 - Create a Partner Interconnect
	 - Create a Partner Interconnect attachment in Google Cloud Console
                or gcloud CLI. Copy the pairing key that is provided as part of
                the attachment creation. 
	 - In the Megaport Portal, create a VXC from your MVE to connect to your
   Google Cloud attachment.

	 - In FortiManager, create a new interface and add the details of the
   Google Cloud connection
    -  [Google Partner
                Interconnects](https://cloud.google.com/interconnect/docs/how-to/partner/provisioning-overview).
                    
 - Setting up Parter Interconnect on GCP.
 - To create and provision a Partner Interconnect connection, follow these steps:

1.  [Create a VLAN attachment](https://cloud.google.com/network-connectivity/docs/interconnect/how-to/partner/creating-vlan-attachments)
    
    Create a VLAN attachment for a Partner Interconnect connection. This step generates a pairing key that you share with your service provider. The pairing key is a unique key that lets a service provider identify and connect to your Virtual Private Cloud (VPC) network and associated Cloud Router. The service provider requires this key to complete the configuration of your VLAN attachment.
    
2.  [Request a connection from your service provider](https://cloud.google.com/network-connectivity/docs/interconnect/how-to/partner/requesting-connections)
    
    Go to your service provider to submit the pairing key and other connection details, such as the connection capacity and location. Wait until your service provider configures your connection; they must check that they can serve your requested capacity. After their configuration is complete, you receive an email notification from Google.
    
3.  [Activate your connection](https://cloud.google.com/network-connectivity/docs/interconnect/how-to/partner/activating-connections)
    
    After the service provider configures your connection, you must activate it. Activating the connection and checking its activation status enables you to verify that you established connectivity with the expected service provider.
    
4.  [Configure on-premises routers](https://cloud.google.com/network-connectivity/docs/interconnect/how-to/partner/configuring-onprem-routers)
    
    For Layer 2 connections, you must establish a BGP session between your VPC network's Cloud Router and your on-premises router. Use your service provider's console to find the VLAN ID of the connection. Use that VLAN ID and the BGP peer IP address from the Google Cloud Console to configure your on-premises router.
    
    For Layer 3 connections, the service provider establishes a BGP session with your VPC network's Cloud Router. This configuration is automated and doesn't require any action from you.                   



## Validating your Google Cloud connection

You can review connection details, including the connection state, from the Fortinet CLI with these commands:

-   `get system interface`  – Displays configuration details and current status for the device interfaces.
-   `get router info bgp neighbor <ip-address>`  – Displays configuration details and current status for the BGP neighbors.
