# Inputs for tests scenarios

* **get*.json**: JSON data structures used to test conversion templates and validation/cleanup functionality

## Get data structures

* get-if-raw: raw output of **show interface status | json**
* get-if-interfaces: **vlan_interfaces** created from get-if-raw
* get-vlan-raw: raw output of **show vlans | json**
* get-vlans: **vlan_list** created from get-vlan-raw

Test scenarios:

* 100-200: VLAN 100 (ACME) and 200 (Wonka)
* 100-202: VLAN 100 (ACME), 200 (Wonka), 201 (Extra-shutdown), 202 (Willy-Suspended) + extra ports configured for every VLAN
* 1: VLAN 1 only

## Per-node service data models

The **model*.json** files files contain various per-node data models for leaf-1. Scenarios:

* 100: ACME is active, Wonka is absent
* 100-200: Active service for ACME and Wonka
