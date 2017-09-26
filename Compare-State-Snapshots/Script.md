# Demo script for "Compare State Snapshots" case study

## Prepare for the demo

Collect SSH keys with `get-keys.yml`

Turn on LLDP with
```
ansible-playbook fix/deploy_lldp.yml
```
Check out the inital branch with time-dependent state
```
git checkout Compare-State-Initial
```

## Step 1: Time-dependent state

Collect the state
```
ansible-playbook get-state.yml -e output=snapshot
more snapshot/E1.yml
```

## Step 2: Fixed state gathering

Check out the final branch
```
git checkout Work
```
Collect state
```
ansible-playbook get-state.yml -e output=snap_before
colordiff -au snapshot snap_before|less -r
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
Compare the state
```
colordiff -au snap_before snap_after|less -r
```
