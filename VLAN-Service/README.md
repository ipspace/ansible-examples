# Manage a simple VLAN service

This playbooks in this repository manage a simple VLAN service described in the *services.yml* data model.

## Explore the progress

I created a number of git tags while developing this example to allow you to explore various stages of the project. Use `git checkout -B demo tagname` to check out the desired stage of the project into your working directory.

The tags you can sync to are:

* ***VLAN_Initial*** - initial implementation that provisions VLAN database, interfaces and access VLANs straight from the services data model
* ***VLAN_Data_Model*** - transforms services data model into per-node data model at the beginning of the playbook for easier processing. The introduction of per-node data model simplified the provisioning process.
* ***VLAN_Decommission*** - add support for service decommissioning and customer site description in the services data model, which triggered changes in data model transformation and minor adjustments in service provisioning process.

## Tests

All the tests included in this project are in *tests* directory:

* ***model.yml*** - creates per-node data models and stores them in *printouts* directory
