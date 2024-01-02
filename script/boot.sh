#!/bin/bash

pushd "$(dirname $0)" >> /dev/null 

echo "Fixing ssh permissions"
chmod 600 /root/.ssh/authorized_keys
chown root:root /root/.ssh/authorized_keys

echo "Starting Windows..."
./setup-windows-vm.sh & 

echo "Waiting for Windows to boot..."
sleep 60

echo "Starting proxy..."
./proxy.sh

popd >> /dev/null