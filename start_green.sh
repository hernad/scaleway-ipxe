#!/bin/bash

ISO_PATH=http://dl.bintray.com/hernad/greenbox
ISO_PATH=http://download.bring.out.ba
ISO_PATH=http://212.47.245.111

GREENBOX_VER=4.3.5

SERVER_NAME=greenbox-scw-0

SERVER_ID=`scw ps | grep "running.*$SERVER_NAME" | awk '{print $1}'`

while [ -z "$SERVER_ID" ]
do
  echo starting $SERVER_NAME

  SERVER_STOPPING=`scw ps -a | grep "stopping.*$SERVER_NAME" | awk '{print $1}'`
  while [ ! -z "$SERVER_STOPPING" ] ; do
     echo "$SERVER_NAME is in stopping process ... waiting 30sec ..."
     sleep 30
     SERVER_STOPPING=`scw ps -a | grep "stopping.*$SERVER_NAME" | awk '{print $1}'`
  done

  echo scw start $SERVER_NAME
  scw start $SERVER_NAME
  echo sleep 10 ...
  sleep 10
  SERVER_ID=`scw ps | grep "running.*$SERVER_NAME" | awk '{print $1}'`

done

scw restart $SERVER_ID

./scw-ipxe-start.expect $SERVER_ID "initrd ${ISO_PATH}/greenbox-${GREENBOX_VER}.iso" "chain http://boot.salstar.sk/memdisk iso raw"

