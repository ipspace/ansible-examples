# A Quick-and-Dirty Solution to Manage DHCP Pools

The Ansible playbooks in this directory manage DHCP pools and DNS host
mappings on one or more Cisco IOS routers or switches.

I use them to manage the configuration of my home router (the actual data is stored in another directory)

## Setup

The scripts expect:
* managed hosts in _hosts_ Ansible inventory;
* DHCP mappings in _pools.yml_;
* list of managed interfaces in host variables.
 
The SSH username and password are specified directly in the inventory file; obviously you should use Ansible vault in production deployments.

## Data model

Host DHCP mappings are defined in _hostPools_ variable in a YAML file. The value of that variable is a dictionary - keys are fully-qualified host names, values are DHCP mappings.

Each DHCP mapping is a dictionary with these values:
* **id**: DHCP client ID or MAC address
* **ip**: static IP assigned to that host

Host variables should contain the list of managed interfaces. _interfaces_ variable should be a dictionary of interface names/parameters (see also _host___vars/gw.yml_). Interface parameters include:
* **ip**: IP prefix configured on the interface
* **dhcp**: must be set to *enabled* to include the interface in DHCP configuration
* **domain**: DHCP domain name

## Playbooks

The following playbooks are used to configure DHCP pools on Cisco IOS devices:
* **extract.yml**: Extract existing host DHCP pools into per-device YAML data model in_pools_ directory
* **check.yml**: Checks the existing pools configured on managed devices and reports extraneous pools (see also _device configuration_ section)
* **cleanup.yml**: Removes extraneous pools (those reported by *check.yml*) from managed device configuration.
* **configure.yml**: Configure DHCP pools

## Device configuration

The playbooks expect two types of DHCP pools on managed devices:
* Interface pools (pool name = DHCP or interface name)
* Host pools (pool name = host FQDN as specified in the data model)

All other pools are considered extraneous.

The playbooks create and/or remove host pools and do not manage interface pools.
