#!/bin/bash

pushd configuration

ansible-playbook site.yml -i inventory -u root -k

popd
