# Log executed commands on Cisco IOS

The playbook in this directory enables or disables command logging (via EEM applet or config logger)
on Cisco IOS devices.

## Use
**ansible-playbook -i _inventory_ --extra-vars log=[enabled|disabled|config] trace.yml**

## Behind the scenes

Using the **log** variable (default value: enabled) the playbook takes a configuration snippet and pushes
it to all devices in the inventory file using **ios_config** module.

## Build-your-own ideas

You can use the playbook as a generic configure-something-on-IOS solution. Change the **configlets** dictionary (embedded in the playbook) to have more (or fewer) configuration snippets.

And when you discover you want to know more, [register for the Building Network Automation Solutions online course](http://ipspace.net/NetAutSol).
