# DMVPN Topology Using IOSv with Vagrant on libvirt

This directory contains the files needed to set up the DMVPN topology using Vagrant on libvirt (tested on Ubuntu 20.04).

To recreate this environment in your lab:

* Create a Ubuntu host
* Install Vagrant, KVM and libvirt
* [Install libvirt Vagrant provider](https://codingpackets.com/blog/using-the-libvirt-provider-with-vagrant/). When the recipe asks you to create **vagrant-libvirt.xml** file, use the one in this directory to set up static DHCP mappings.
* [Build IOSv Vagrant box](https://codingpackets.com/blog/cisco-iosv-vagrant-libvirt-box-install/)
* Copy **Vagrantfile** from this directory to your _libvirt_ host and create the DMVPN network with **vagrant up**
* Check that you can reach the IOS hosts on IP addresses 192.168.121.101 through 192.168.121.106

## Accessing libvirt Virtual Machines

Vagrant _libvirt_ plugin uses **vagrant-libvirt** virtual network for management interfaces. If you run Ansible playbooks on the same machine, you can connect directly to these IP addresses, but if you want to run Ansible somewhere else (example: in your development environment) you have to use SSH proxy to access these virtual machines:

* Create SSH key pair if needed using **ssh-keygen**
* Copy your public SSH key to the _libvirt_ host using **ssh-copy-id**
* Check that you can connect to the _libvirt_ host using your SSH key by executing **ssh _hostname_**

Once this infrastructure is in place, you can SSH to the virtual machines using **ssh** -J option:

```
ssh -J bastionhost vagrant@vm-ip
```

## Using DMVPN Examples

Examples in the parent directory assume a VIRL-based lab. To use your newly-created _libvirt_ environment execute `. setup-libvirt.sh` to use a different Ansible configuration file, and libvirt-specific addendum to your Ansible inventory.
