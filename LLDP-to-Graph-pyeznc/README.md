# Generate network topology graph from LLDP neighbors using junos-eznc

The *LLDP-to-Graph-eznc* Ansible playbook uses LLDP neighbor data collected
with Juniper's stdlib ansible module to generate network diagram in *Graphviz* .dot file format.

## Installation guide

The playbooks were tested with these versions of Ansible, junos-eznc and  ansible-junos-stdlib:

* Ansible 2.4
* junos-eznc 2.1.7
* ansible-junos-stdlib 2.0.0

Notes:

* The playbook collects data only from Juniper equipment using the default junos-eznc and ansible-junos-stdlib libraries.


## Usage

* Create your inventory file named ***hosts***. 
* Install ***junos-eznc*** using the pip tool inside your virtualenv,
* Install the ***ansible-junos-stdlib*** from https://github.com/Juniper/ansible-junos-stdlib in the roles subdirectory,
* Install *graphviz*
* Generate the network topology file with
```
ansible-playbook LLDP-to-Graph-pyeznc.yml
```
* Generate the network diagram (in PNG format) with
```
dot -Tpng network.dot >network.png
```
* Enjoy, modify and submit a pull request when you add something awesome

## More information

* [Ansible for Networking Engineers](http://www.ipspace.net/Ansible_for_Networking_Engineers) online course ([contents](https://my.ipspace.net/bin/list?id=AnsibleOC))
* [Building Network Automation Solutions](http://www.ipspace.net/Building_Network_Automation_Solutions) online course ([contents](https://my.ipspace.net/bin/list?id=NetAutSol))
