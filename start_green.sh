#!/bin/bash

ISO_PATH=http://dl.bintray.com/hernad/greenbox
ISO_PATH=http://download.bring.out.ba
ISO_PATH=http://212.47.245.111

GREENBOX_VER=4.4.1

SERVER_NAME=greenbox-scw-0


SERVER_STOPPING=`scw ps -a | grep "stopping.*$SERVER_NAME" | awk '{print $1}'`
while [ ! -z "$SERVER_STOPPING" ] ; do
     echo "$SERVER_NAME is in stopping process ... waiting 30sec ..."
     sleep 30
     SERVER_STOPPING=`scw ps -a | grep "stopping.*$SERVER_NAME" | awk '{print $1}'`
done


SERVER_ID=`scw ps | grep "running.*$SERVER_NAME" | awk '{print $1}'`
if [ -z "$SERVER_ID" ]
then
  SERVER_ID=`scw ps -a | grep "$SERVER_NAME" | awk '{print $1}'`
  echo starting $SERVER_ID
  scw start $SERVER_ID
else
  echo restarting $SERVER_ID
  scw restart $SERVER_ID
fi

./scw-ipxe-start.expect $SERVER_ID "initrd ${ISO_PATH}/greenbox-${GREENBOX_VER}.iso" "chain http://boot.salstar.sk/memdisk iso raw"

