# Deploy IGP+BGP routing and MPLS/VPN services in a multi-provider network

This set of playbooks deploys routing protocol (OSPF/IBGP/EBGP) configurations and
MPLS/VPN configurations on a set of Cisco IOS routers residing in one or more closely
coupled autonomous systems.

## Overview

The playbooks use a data model describing infrastructure (**fabric.yml**) and services (**services-vpnv4.yml**). The **create-data-model-yml** playbook transforms these data models (described in more details below) into per-node data models (stored in **nodes.yml**) that are easier to work with when generating device configurations.

The playbooks in *bgp*, *ospf* and *vpnv4* directories read per-node data models from **nodes.yml**, create and deploy device configurations, and verify OSPF/BGP adjacencies. Invoke them from the main directory (otherwise the won't find the **nodes.yml**) with one or more of these tags:

* **configs** - create the configuration files in *configs* directory
* **deploy** - deploy the configuration files from the *configs* directory to the devices
* **verify** - verify OSPF or BGP adjacencies

## Data model

The *infrastructure* data model in **fabric.yml** has these sections:

* **services** - a list of services supported by the network. Elements of this list can be *IPv4*, *VPNv4* and *InterAS* (for inter-as VPNv4)
* **nodes** - a list of nodes in the network. Every node has *name*, *mgmt* IP address (used to access the node) and router ID IP address (*rid*) configured on its loopback interface
* **asn** - a dictionary of AS numbers. Each ASN has two elements: *members* is a list of device names belonging to the AS, *rr* is the list of route reflectors in that AS.
* **fabric** - list of intra-AS links. Every link has *left* and *right* nodes, *left_ip* and *right_ip* IP addresses and *left_port* and *right_port* interfaces. *cost* is optional. OSPF is configured on intra-AS links.
* **interas** - list of inter-AS links (similar to intra-AS links). EBGP is configured on inter-AS links.

The *services-vpnv4* data model is a dictionary of customers with every customer having these elements:

* **rd** - value used for MPLS/VPN RD and import/export RT (the data model and the playbooks support only simple non-overlapping VPNs)
* **nodes** - a dictionary of PE-routers used in this service. The values of these elements is a dictionary of VRF interfaces with each interface having **ip** element (IP prefix configured on PE-router VRF interface)
