# Generate network topology graph from LLDP neighbors

The *LLDP-to-Graph* Ansible playbook uses LLDP neighbor data collected
with *napalm_get_facts* Ansible module to generate network diagram in *Graphviz* .dot file format.

## Installation guide

The playbooks were tested with these versions of Ansible and NAPALM:

* Ansible 2.4
* napalm 1.2.0 (or greater)
* napalm-ansible 0.7.0 (or greater)

Notes:

* The playbooks have been updated to work with Ansible 2.4 and will not work with previous versions of Ansible
* Run `napalm-ansible` to find path to your distribution of NAPALM and update ansible.cfg accordingly

Updates from the [Ansible for Networking Engineers](https://www.ipspace.net/Ansible) case study (details [here](https://my.ipspace.net/bin/list?id=AnsibleOC#SAMPLES)):

* The playbooks and Jinja2 templates have been updated to support platforms (like Cisco IOS) that send shortened interface names in LLDP updates
* The playbooks work with a mix of hostnames and FQDNs (for example, E1 versus E1.virl.info)
* Use `-e no_domain=1` option on `ansible-playbook` command line to use short hostnames in printouts and graphs

Use `git checkout LLDP-to-Graph-v1.0` to get the source files matching the original case study.

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
