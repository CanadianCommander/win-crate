#!/bin/bash

pushd "$(dirname $0)" >> /dev/null 

VM_IP=$(virsh net-dhcp-leases default | grep -E '[0-9.]+/[0-9]+' -o | grep -E '^[0-9.]+' -o)

simpleproxy -L 0.0.0.0:80 -R $VM_IP:80 & 
simpleproxy -L 0.0.0.0:443 -R $VM_IP:443

popd >> /dev/null