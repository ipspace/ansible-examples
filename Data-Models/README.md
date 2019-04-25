This set of directories illustrates the data model deduplication
article published on ipSpace.net during spring/summer 2019.
URLs will be inserted at the time individual parts of the article
are published.

To use the examples:

* Clone the repository
* Execute `. setup.sh` in current directory to set Ansible environment
  variables
* Within a subdirectory execute `ansible-playbook configs.yml`
* Inspect .cfg files within the subdirectory

The subdirectories contain these steps in data model evolution:

* **Initial**: initial box-specific data model
* **BGP_AS**: data model replacing BGP AS number with name of BGP neighbor
* **BGP_IF**: data model replacing peer IP address with name of BGP neighbor's interface
* **Network**: data model describing network nodes and links
* **Network_Macro**: Refactored Jinja2 configuration template for the *Network* data model
* **Network_Dict**: Refactored network data model supporting stub interfaces and multi-access links
* **Network_Prefix**: Replace per-node IP addresses with link prefixes
