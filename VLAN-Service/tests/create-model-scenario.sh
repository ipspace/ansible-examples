#!/bin/bash
#
# Create model scenario
# - executes model.yml playbook
# - copies generated data model for leaf-1 as a scenario into inputs directory
#
if [ -z "$1" ]; then
  echo "You have to specify the scenario name"
  exit
fi
#
rm ../printouts/*.json
ansible-playbook -i ../hosts model.yml
cp ../printouts/leaf-1-model.json inputs/model-$1.json
