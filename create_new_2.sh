#!/bin/bash

REGION=par1
SERVER_NAME=greenbox-scw-2
SERVER_TYPE=VC1M
SERVER_IMG=Ubuntu_Xenial

echo 8GB sesija

RUN="scw --region=$REGION run --show-boot --name=$SERVER_NAME --commercial-type=$SERVER_TYPE $SERVER_IMG" 
echo $RUN
eval $RUN


