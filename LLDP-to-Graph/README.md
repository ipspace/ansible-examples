# Generate network topology graph from LLDP neighbors

The *LLDP-to-Graph* Ansible playbook uses LLDP neighbor data collected
with *napalm_get_facts* Ansible module to generate network diagram in *Graphviz* .dot file format.

## Usage

* Create your inventory file. The current **hosts** file uses vEOS leaf-and-spine topology. Set IP addresses, usernames, passwords and ports in the inventory file.
* Install NAPALM Ansible modules with `git clone https://github.com/napalm-automation/napalm-ansible/` (assuming you already installed NAPALM)
* Install *graphviz*
* Generate the network topology file with
```
ansible-playbook LLDP-to-Graph.yml
```
* Generate the network diagram (in PNG format) with
```
dot -Tpng network.dot >network.png
```
* Enjoy, modify and submit a pull request when you add something awesome

## More information

* [Ansible for Networking Engineers](http://www.ipspace.net/Ansible_for_Networking_Engineers) online course ([contents](https://my.ipspace.net/bin/list?id=AnsibleOC))
* [Building Network Automation Solutions](http://www.ipspace.net/Building_Network_Automation_Solutions) online course ([contents](https://my.ipspace.net/bin/list?id=NetAutSol))
