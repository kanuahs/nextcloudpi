#!/bin/bash

# Batch creation of NextCloudPi image
#
# Copyleft 2017 by Ignacio Nunez Hernanz <nacho _a_t_ ownyourbits _d_o_t_ com>
# GPL licensed (see end of file) * Use at your own risk!
#
# Usage: ./batch.sh <DHCP QEMU image IP>
#

set -e
source buildlib.sh

SIZE=3G                     # Raspbian image size
#CLEAN=0                    # Pass this envvar to skip cleaning download cache
IMG="NextCloudPi_RPi_$( date  "+%m-%d-%y" ).img"

##############################################################################

## preparations

IMG=tmp/"$IMG"

prepare_dirs                   # tmp cache output
download_raspbian "$IMG"
resize_image      "$IMG" "$SIZE"
update_boot_uuid  "$IMG"       # PARTUUID has changed after resize

# make sure we don't accidentally disable first run wizard
rm -f ncp-web/{wizard.cfg,ncp-web.cfg}

## BUILD NCP

echo -e "\e[1m\n[ Build NCP ]\e[0m"
prepare_chroot_raspbian "$IMG"

mkdir raspbian_root/tmp/ncp-build
cp -r *.sh etc bin ncp-web raspbian_root/tmp/ncp-build

PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin \
  sudo chroot raspbian_root /bin/bash <<'EOFCHROOT'
    # mark the image as an image build
    touch /.ncp-image

    # update packages
    apt-get update

    # As of 10-2018 this upgrades raspi-kernel and messes up wifi and BTRFS
    #apt-get upgrade -y
    #apt-get dist-upgrade -y

    # As of 03-2018, you dont get a big kernel update by doing
    # this, so better be safe. Might uncomment again in the future
    #$APTINSTALL rpi-update
    #echo -e "y\n" | PRUNE_MODULES=1 rpi-update

    # install everything
    cd /tmp/ncp-build || exit 1
    source etc/library.sh
    install_script  lamp.sh
    install_script  etc/ncp-config.d/nc-nextcloud.sh
    activate_script etc/ncp-config.d/nc-nextcloud.sh
    install_script  ncp.sh
    activate_script etc/ncp-config.d/nc-init.sh
    install_script  post-inst.sh

    # harden SSH further for Raspbian
    sed -i 's|^#PermitRootLogin .*|PermitRootLogin no|' /etc/ssh/sshd_config

    # default user 'pi' for SSH
    sed -i 's|^USER_=.*|USER_=pi|'              /usr/local/etc/ncp-config.d/SSH.sh
    sed -i 's|^PASS_=.*|PASS_=raspberry|'       /usr/local/etc/ncp-config.d/SSH.sh
    sed -i 's|^CONFIRM_=.*|CONFIRM_=raspberry|' /usr/local/etc/ncp-config.d/SSH.sh

    rm -rf /tmp/ncp-build
EOFCHROOT

clean_chroot_raspbian

## pack
 
TAR=output/"$( basename "$IMG" .img ).tar.bz2"
pack_image "$IMG" "$TAR"

## test

#set_static_IP "$IMG" "$IP"
#test_image    "$IMG" "$IP" # TODO fix tests

# upload
create_torrent "$TAR"
upload_ftp "$( basename "$TAR" .tar.bz2 )"


# License
#
# This script is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This script is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this script; if not, write to the
# Free Software Foundation, Inc., 59 Temple Place, Suite 330,
# Boston, MA  02111-1307  USA
