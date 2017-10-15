# Deploy OSPF in a network fabric

This directory contains a set of playbooks that deploy OSPF in
a network fabric defined in the *fabric.yml* data model:

* **validate-fabric.yml** starts LLDP on all network devices and validates interface status and fabric connectivity using LLDP
* **deploy.yml** configures OSPF and validates OSPF adjacencies

You'll find detailed description of these playbooks in the [Ansible for Networking Engineers](http://www.ipspace.net/Ansible_for_Networking_Engineers) online course.

Note: to get the sources used in the online course do `git checkout OSPF-Deployment-v1.0`

## Installation guide

The playbooks were tested with these versions of Ansible and NAPALM:

* Ansible 2.4
* napalm 1.2.0 (or greater)
* napalm-ansible 0.7.0 (or greater)

Notes:

* The playbooks have been updated to work with Ansible 2.4 and will not work with previous versions of Ansible
* Run `napalm-ansible` to find path to your distribution of NAPALM and update ansible.cfg accordingly

## More information

* [Ansible for Networking Engineers](http://www.ipspace.net/Ansible_for_Networking_Engineers) online course ([contents](https://my.ipspace.net/bin/list?id=AnsibleOC))
* [Building Network Automation Solutions](http://www.ipspace.net/Building_Network_Automation_Solutions) online course ([contents](https://my.ipspace.net/bin/list?id=NetAutSol))
