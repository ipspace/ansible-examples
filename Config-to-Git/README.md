# Collect Cisco IOS configurations and store them to Git repository

The playbooks in this directory collect Cisco IOS configurations
and store them in a Git repository.

## Setup

Ansible variables required for proper operation:

* **repository**: directory already set up as a local Git repository
* **branch**: git branch used for actual device configurations. The branch has to exist before the *git_commit.yml* playbook is run

Optional:
* Install *NAPALM* library (if required) using [NAPALM installation instructions](https://napalm.readthedocs.io/en/latest/installation/index.html)
* Install *napalm-ansible* library with ```git clone https://github.com/napalm-automation/napalm-ansible```

## Usage

Collect device configurations with one of these methods:

* SCP (*gc_scp.yml*) - requires "ip scp enable" configured on the device
* **show running** (*gc_show.yml*)
* *NAPALM* (*gc_napalm.yml*) - needs NAPALM library and napalm-ansible module

Commit the changes in device configurations to git repository with *git_commit.yml*