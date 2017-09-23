# Demo script for "Compare State Snapshots" case study

```
ansible-playbook get-state.yml -e output=snap_before
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
