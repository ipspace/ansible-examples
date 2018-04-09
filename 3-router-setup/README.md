# Ansible configuration files used with Inter-AS VIRL topology

This directory contains Ansible and VIRL files used in a 3-router topology:

* `hosts.yml` - Ansible inventory file in YAML format
* `ansible.cfg` - Ansible configuration file (sets connection and NAPALM plugin directory)
* `3-router.virl` - VIRL topology file
* `setup.sh` - sets environment variables to select Ansible inventory and configuration files.

This topology was used in _Managing network device configurations with Git_ section of [Building Network Automation Solutions](http://www.ipspace.net/Building_Network_Automation_Solutions) online course.

To use these files with your playbooks run `source setup.sh`.