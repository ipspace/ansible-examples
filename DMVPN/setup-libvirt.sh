#!/bin/bash
export ANSIBLE_CONFIG=$(pwd)/libvirt/ansible.cfg
export ANSIBLE_INVENTORY=$(pwd)/hosts,$(pwd)/libvirt/hosts-libvirt.yml
echo "Ansible setup for remote libvirt environment"
echo "============================================"
echo "inventory: $ANSIBLE_INVENTORY"
echo "config: $ANSIBLE_CONFIG"
