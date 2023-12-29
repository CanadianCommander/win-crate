virt-install --name=win --disk path=/var/vm/disk/{{diskname}}.qcow2,size=100,format=qcow2,bus=virtio --ram=16000 --vcpus=4 --check-cpu --hvm --location=/var/vm/iso/win.iso  --network=bridge:virbr0

