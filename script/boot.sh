pushd "$(dirname $0)" >> /dev/null 

echo "Fixing ssh permissions"
chmod 600 /root/.ssh/authorized_keys
chown root:root /root/.ssh/authorized_keys

echo "Starting Windows"
./setup-windows-vm.sh

popd >> /dev/null