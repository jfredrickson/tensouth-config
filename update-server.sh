#!/bin/bash

pushd configuration

SSH_PORT=`grep "sshd_port:" vars.yml | awk '{print $2}'`

ansible-playbook site.yml -i inventory -e ansible_ssh_port=$SSH_PORT --ask-become-pass

popd
