
echo "Fixing ssh permissions"
chmod 600 /root/.ssh/authorized_keys
chown root:root /root/.ssh/authorized_keys