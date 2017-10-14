#
# shell script to set environment variables
#
echo "Will use ansible.cfg from `pwd`"
export ANSIBLE_CONFIG=`pwd`/ansible.cfg
echo "Ansible inventory set to `pwd`/hosts.yml"
export ANSIBLE_INVENTORY=`pwd`/hosts.yml
