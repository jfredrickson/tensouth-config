#!/bin/bash

SSH_PORT=`grep "sshd_port:" configuration/vars.yml | awk '{print $2}'`
TRAEFIK_PORT=8081
HOST=`cat configuration/inventory`

ssh -p $SSH_PORT -L $TRAEFIK_PORT:localhost:$TRAEFIK_PORT $HOST
