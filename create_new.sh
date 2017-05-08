#!/bin.bash

./scw-ipxe.expect "--name=greenbox-scw-0 --commercial-type=VC1S  Alpine_Linux 50G" "initrd http://159.203.94.161/greenbox.iso" "chain http://boot.salstar.sk/memdisk iso raw"

