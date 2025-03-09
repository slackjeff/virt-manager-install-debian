#!/usr/bin/env bash
########################################################
# Author: Slackjeff
# Install and configure virt-manager on Debian.
########################################################

# Check if user use sudo.
if [[ -z "$SUDO_USER" ]]; then
    echo "Need run $0 with sudo."
    exit 1
fi

# Update repo and install qemu and virt-manager.
apt update
echo -e "\n-------------> Install Qemu and virt-manager."
sleep 2s
apt install                   \
	qemu-kvm              \
	qemu-guest-agent      \
	libvirt-daemon-system \
	libvirt-clients       \
	bridge-utils          \
	virt-manager

# Add user on groups kvm and libvirt
echo -e "\n-------------> Add $SUDO_USER groups: libvirt and kvm."
sleep 2s
adduser $SUDO_USER libvirt
adduser $SUDO_USER kvm

echo -e "\n-------------> Restart Service and enable."
sleep 2s
systemctl start libvirtd
systemctl enable libvirtd
