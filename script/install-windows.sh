
INSTALL_ISO=${INSTALL_ISO:-/var/vm/iso/win.iso}

DISK_NAME=${DISK_NAME:-windows}
DISK_SIZE=${DISK_SIZE:-100}

RAM=${RAM:-8000}
CPU_CORES=${CPU_CORES:-4}

virt-install --name=windows \
  --disk path=/var/vm/disk/${DISK_NAME}.qcow2,size=${DISK_SIZE},format=qcow2,bus=virtio \
  --disk path=/var/vm/cdrom/virtio-win.iso,device=cdrom \
  --ram=${RAM} \
  --vcpus=${CPU_CORES} \
  --check-cpu \
  --hvm \
  --boot=cdrom \
  --os-variant=win11 \
  --cdrom=${INSTALL_ISO} \
  --network=bridge:virbr0

