#!/bin/bash
#
# Create getinfo scenario
# - executes getinfo.yml playbook
# - copies printotus as a scenario into inputs directory
#
if [ -z "$1" ]; then
  echo "You have to specify the scenario name"
  exit
fi
#
rm ../printouts/*.json
ansible-playbook -i ../hosts getinfo.yml
cp ../printouts/leaf-1-get-vlan-raw.json inputs/get-vlan-raw-$1.json
cp ../printouts/leaf-1-get-vlans.json inputs/get-vlans-$1.json
cp ../printouts/leaf-1-get-raw.json inputs/get-if-raw-$1.json
cp ../printouts/leaf-1-get-interfaces.json inputs/get-if-interfaces-$1.json