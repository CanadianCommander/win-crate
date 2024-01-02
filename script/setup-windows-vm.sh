pushd "$(dirname $0)" >> /dev/null 

INSTALL_ISO=${INSTALL_ISO:-/var/vm/iso/win.iso}

DISK_NAME=${DISK_NAME:-windows}
DISK_SIZE=${DISK_SIZE:-100}

RAM=${RAM:-8000}
CPU_CORES=${CPU_CORES:-$(cat /proc/cpuinfo  | grep -i 'cpu cores' | grep -E '[0-9]+' -o | head -1)}

BOOT=""
if [ -f /var/vm/disk/${DISK_NAME}.qcow2 ]; then
  echo "Existing install detected" 
  BOOT="--boot=hd"
else 
  BOOT="--boot=cdrom"
fi 

virt-install --name=windows \
  --disk path=/var/vm/disk/${DISK_NAME}.qcow2,size=${DISK_SIZE},format=qcow2,bus=virtio \
  --disk path=/var/vm/cdrom/virtio-win.iso,device=cdrom \
  --disk path=/var/vm/cdrom/win-tools.iso,device=cdrom \
  --memory memory=${RAM} \
  --memorybacking access.mode=shared \
  --vcpus cores=${CPU_CORES} \
  --check-cpu \
  --hvm \
  ${BOOT} \
  --os-variant=win11 \
  --cdrom=${INSTALL_ISO} \
  --filesystem /var/vm/data/,linux,accessmode=passthrough,driver.type=virtiofs \
  --network=bridge:virbr0

popd >> /dev/null