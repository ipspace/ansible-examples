# Demo script for "Compare State Snapshots" case study

## Preparation

* Start VIRL Inter-AS topology
* Start Ansible VM
* Gather SSH keys

In /vagrant/Examples/Compare-State-Snapshots directory run playbook that configures LLDP on the devices
```
ansible-playbook fix/deploy_lldp.yml
```

## Simplistic approach

Prepare the initial version of the playbooks
```
git checkout Compare-State-Initial
```
Run Ansible playbook to collect initial state
```
ansible-playbook get-state.yml -e output=snap_before
```
Inspect the results
```
more snap_before/E1.yml
```
Time to go back to the drawing board...

## Remove time-dependent state

Switch to the final version of the playbooks
```
git checkout master
```
Collect initial state
```
ansible-playbook get-state.yml -e output=snap_before
```
Inspect the results
```
more snap_before/E1.yml
```
Log into one of the routers, turn off an interface
```
sshpass -p cisco ssh cisco@172.16.1.111
config terminal
interface gig 0/2
shutdown
```
Repeat state gathering
```
ansible-playbook get-state.yml -e output=snap_after
```
Compare state before and after
```
colordiff -ru snap_before snap_after|less -r
```
