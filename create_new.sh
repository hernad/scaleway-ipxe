#!/bin/bash

REGION=ams1
#REGION=par1
SERVER_NAME=greenbox-scw-am
#SERVER_TYPE=C2L
#SERVER_TYPE=VC1M
SERVER_TYPE=VC1S
SERVER_IMG=Ubuntu_Xenial

RUN="scw --region=$REGION run --show-boot --name=$SERVER_NAME --commercial-type=$SERVER_TYPE $SERVER_IMG" 
echo $RUN
$RUN


