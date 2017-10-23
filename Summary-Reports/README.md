# Create a simple device uptime report

This directory contains the source code for the _Creating Reports_ video in the [Creating Summary and Compliance Reports](https://my.ipspace.net/bin/list?id=NetAutSol&module=2#M2S2) part of [Building Network Automation Solutions](http://www.ipspace.net/Building_Network_Automation_Solutions) online course.

The sources have been modified to work with Ansible 2.4:

* Removed `provider` parameter from `ios_facts` module
* Removed `group_vars` directory (no longer needed because we don't use the *provider* parameter)