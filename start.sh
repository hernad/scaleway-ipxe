#!/bin/bash

#scw start greenbox-scw-0
scw restart greenbox-scw-0

./scw-ipxe-start.expect "initrd https://dl.bintray.com/hernad/greenbox/greenbox-4.2.6.iso" "chain http://boot.salstar.sk/memdisk iso raw"

