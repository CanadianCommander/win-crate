FROM ubuntu:22.04

# install packages 
RUN apt update -y 
RUN apt install -y qemu-kvm libvirt-daemon-system libvirt-dev virt-manager curl jq wget gpg lsb-release bridge-utils netplan.io vim systemd iputils-ping dnsutils openssh-server

# copy iso 
RUN mkdir -p /var/vm/iso/
COPY win.iso /var/vm/iso/win.iso

# copy scripts
COPY script/ /root/

# all root login via ssh
RUN echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config

# setup network bridge 
#COPY 01-network-bridge.yaml /etc/netplan/01-network-bridge.yaml 
#RUN sed -i "s/{{interface}}/eth0/g" /etc/netplan/01-network-bridge.yaml


USER root 
RUN echo root:root | chpasswd 

ENTRYPOINT ["systemd", "--system"]
