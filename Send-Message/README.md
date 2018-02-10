# Send a complex command to Cisco IOS device

The _message.yml_ playbook uses **send** Cisco IOS command to send messages to all other lines (VTY + CON) on the same device.

The trick:

* Figure out the whole sequence of characters that needs to be sent to the device (until you get the router prompt back)
* Replace "return" with \n and control characters with \xCC (where _CC_ = control character ASCII code in hex)
