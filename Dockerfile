FROM ubuntu:22.04

# install packages 
RUN apt update -y 
RUN apt install -y \
  qemu-kvm \
  libvirt-daemon-system \
  libvirt-dev \
  virt-manager \
  curl \
  jq \
  wget \
  gpg \
  lsb-release \
  bridge-utils \
  netplan.io \
  vim \
  systemd \
  iputils-ping \
  dnsutils \
  openssh-server \
  genisoimage \
  simpleproxy

# setup ssh
RUN echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config

# make vm dirs 
RUN mkdir -p /var/vm/disk && \
  mkdir -p /var/vm/data && \
  mkdir -p /var/vm/cdrom

# download virtio driver for windows 
RUN wget https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/stable-virtio/virtio-win.iso -O /var/vm/cdrom/virtio-win.iso

# copy scripts
COPY script/ /root/

# build tools ISO for windows scripts 
RUN genisoimage -o /var/vm/cdrom/win-tools.iso /root/win

# setup boot script 
COPY script/win-crate-boot.service  /etc/systemd/system/win-crate-boot.service
RUN systemctl enable win-crate-boot

ENTRYPOINT ["systemd", "--system"]
