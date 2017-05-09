#!/bin/bash

REGION=ams1  # ams1, par1
SERVER_NAME=greenbox-scw-0
SERVER_TYPE=VC1S

scw run --region=$REGION --name=$SERVER_NAME --commercial-type=$SERVER_TYPE  Alpine_Linux
 

