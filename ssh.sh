#!/bin/bash

# Convenient script to ssh into an instance, while setting up port forwarding
# to localhost for accessing the Traefik dashboard.
#
# This script should only be used after initially setting the password.
# Otherwise, the connection will fail due to being unable to initiate the port
# forwarding.

SSH_PORT=`grep "sshd_port:" configuration/vars.yml | awk '{print $2}'`
TRAEFIK_PORT=8081
HOST=`cat configuration/inventory`

ssh -p $SSH_PORT -L $TRAEFIK_PORT:localhost:$TRAEFIK_PORT $HOST
