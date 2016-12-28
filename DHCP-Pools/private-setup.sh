#!/bin/bash
#
# This script sets environment variables that point to private (non-repo) versions of inventory file and DHCP pools
#
export PS1="\W $ "
export ANSIBLE_INVENTORY="../Private/gw-hosts"
export EXTRA_POOLS="../Private/pools.yml"
