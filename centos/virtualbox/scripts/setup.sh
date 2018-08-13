#!/bin/sh

yum -y install gcc make bzip2 kernel-devel dkms
yum -y install "kernel-devel-uname-r == $(uname -r)"

mount -o loop /home/smeup/VBoxGuestAdditions.iso /mnt
/mnt/VBoxLinuxAdditions.run
umount /mnt
rm -rf VBoxGuestAdditions.iso
