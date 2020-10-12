#!/bin/bash
#
# Validate prefix-based network model (see Network_Prefix directory for details)
#

# Exit on first failure - also ensures the exit code will be set correctly
set -e

# Convert host variables from Ansible inventory into a JSON file
# Use hosts JSON schema to validate the data
#
ansible-inventory -i ../hosts --list | jq ._meta.hostvars >/tmp/$$.hosts.json
jsonschema -i /tmp/$$.hosts.json hosts.schema.json

# Convert network YAML file into a JSON file and validate it with network JSON schema
#
yq <network.yml . >/tmp/$$.network.json
jsonschema -i /tmp/$$.network.json network.schema.json

# Cleanup
rm /tmp/$$.*.json
