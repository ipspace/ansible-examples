# Convert VIRL topology file into Ansible inventory

The VIRL2Inventory.py script reads VIRL topology file (in XML format)
and produces list of hosts in simple Ansible inventory format.

## Usage
    Usage: VIRL2Inventory -i file [-jva]
    
    -i: specify input file (default: topology.virl)
    -j: output JSON
    -a: use ansible_host instead of ip variable
    -v: verbose

## Behavior
For every &lt;node&gt; object in the XML file the script extracts:

* node name (**name** attribute)
* operating system (**subtype** attribute)
* management IP address (**ipv4** attribute)

The management IP address is replaced with the extensions entry with
key=**static_ip** when you configured external management network with
static IP addresses in VIRL (highly recommended).
## Output
One line per VIRL object in format

    *name* ip=*ip* os=*os*

Value **ip** is replaced with **ansible_host** when the -a option is specified.