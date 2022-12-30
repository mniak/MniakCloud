#!/bin/bash 

NAME=mniak-cloud-test

lxc delete $NAME --force
lxc launch ubuntu:20.04 $NAME --config=user.user-data="$(cat cloud-init.yaml)"
lxc exec mniak-cloud-test -- bash -c "cloud-init status --wait > /dev/null & tail -n+1 /var/log/cloud-init-output.log -F --pid=\$(jobs -p) 2>/dev/null"

lxc shell $NAME

printf 'Do you want to delete the container (y/N)? '
read answer
if [ "$answer" != "${answer#[Yy]}" ]; then
    lxc delete $NAME --force
fi

