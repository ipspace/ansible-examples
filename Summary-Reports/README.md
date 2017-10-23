# Create simple summary reports

This directory contains several simple summary reports discussed in the _Easy Wins_ part of [Building Network Automation Solutions](http://www.ipspace.net/Building_Network_Automation_Solutions) online course:

* **inventory** - Simple inventory report listing device name, software version and serial number in text, CSV and HTML format;
* **framework** - An extensible report framework generating device uptime reports in various formats
* **hosts-file** - Creates `/etc/hosts` file and `in-addr.arpa` DNS zone file from IP addresses collected from network devices.

The playbooks have been tested with Ansible 2.4 and napalm-ansible 0.7.0.