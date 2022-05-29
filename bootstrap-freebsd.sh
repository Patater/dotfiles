#!/bin/sh

# pkg
mkdir -p /usr/local/etc/pkg/repos
echo "FreeBSD: { enabled: no }" > /usr/local/etc/pkg/repos/FreeBSD.conf

# Install poudriere
pkg install poudriere
pkg install ccache
mkdir -p /usr/obj/ccache

ln -s $(CWD)/usr/local/etc/poudriere.conf /usr/local/etc/poudriere.conf
echo "max_size = 15.0G" > /usr/obj/ccache/ccache.conf

zfs create -o canmount=off zroot/usr/local
zfs create -o mountpoint=/usr/local/poudriere zroot/usr/local/poudriere
# the above seems a bit suspect, as poudriere creates things at /poudriere
# by default, in addition to also at /usr/local/poudriere

poudriere jail -c -j amd64-12-2 -v 12.2-RELEASE
poudriere ports -cp head
#poudriere options -j amd64-12-2 -p head -f /usr/local/etc/poudriere.d/pkglist
poudriere bulk -j amd64-12-2 -p head -f /usr/local/etc/poudriere.d/pkglist

ln -s $(CWD)/usr/local/etc/poudriere.d/pkglist /usr/local/etc/poudriere.d/pkglist
ln -s $(CWD)/usr/local/etc/poudriere.d/make.conf /usr/local/etc/poudriere.d/make.conf

mkdir -p /usr/local/etc/pkg/repos
ln -s $(CWD)/usr/local/etc/pkg/repos/FreeBSD.conf /usr/local/etc/pkg/repos/FreeBSD.conf
ln -s $(CWD)/usr/local/etc/pkg/repos/amd64-12-2.conf /usr/local/etc/pkg/repos/amd64-12-2.conf

# Install all the packages
xargs sudo pkg install -fy < /usr/local/etc/poudriere.d/pkglist

# samba
pkg install samba412
#pdbedit -a -u jaeden (enter password and stuff manually)
sysrc samba_server_enable=YES
service samba_server start

# zfs management
sysrc daily_scrub_zfs_enable=YES

# Webcam
sysrc cuse_load=YES
sysrc webcamd_enable=YES
sysrc kldlist+=cuse
sysrc kldlist+=fusefs

# Bhyve
sysrc -f /etc/sysctl.conf net.link.up_on_open=1
sysctl net.link.tap.up_on_open=1
sysrc kldlist+=vmm
sysrc kldlist+=nmdm
