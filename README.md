# NextCloudPi [![chatroom icon](https://patrolavia.github.io/telegram-badge/chat.png)](https://t.me/NextCloudPi) [![forums icon](https://img.shields.io/badge/help-forums-blue.svg)](https://help.nextcloud.com/c/support/appliances-docker-snappy-vm) [![Donate](https://img.shields.io/badge/Donate-PayPal-green.svg)](https://www.paypal.com/cgi-bin/webscr?cmd=_donations&business=N8PJHSEQF4G7Y&lc=US&item_name=Own%20Your%20Bits&item_number=NextCloudPi&no_note=1&no_shipping=1&currency_code=EUR&bn=PP%2dDonationsBF%3abtn_donate_LG%2egif%3aNonHosted) [![blog](https://img.shields.io/badge/follow-blog-orange.svg)](https://ownyourbits.com)


![NC Logo](https://ownyourbits.com/wp-content/uploads/2017/11/ncp-square.png)

This is the build code for [NextCloudPi](https://nextcloudpi.com).

NextCloudPi is a ready to use image for Raspberry Pi, Odroid HC1, rock64 and other boards.

This code also generates the [NextCloudPi docker images](https://hub.docker.com/r/ownyourbits/nextcloudpi/) for ARM and x86 platforms, and includes an installer for any Debian based system.

## Features

 * Debian/Raspbian 9 stretch
 * Nextcloud 14.0.4
 * Apache 2.4.25, with HTTP2 enabled
 * PHP 7.2
 * MariaDB 10
 * Redis memory cache ( NEW 11-12-2017 )
 * ncp-config for easy setup ( RAM logs, USB drive and more )
 * Automatic redirection to HTTPS
 * ACPU PHP cache
 * PHP Zend OPcache enabled with file cache
 * HSTS
 * Cron jobs for Nextcloud
 * Sane configuration defaults
 * Full emoji support ( NEW 05-24-2017 )
 * Postfix email
 * Secure

## Extras

 * Setup wizard ( NEW 09-27-2017 )
 * NextCloudPi Web Panel ( NEW 07-24-2017 )
 * Wi-Fi ready ( NEW 03-31-2017 )
 * Ram logs ( NEW 03-31-2017 )
 * Automatic security updates, activated by default. ( NEW 03-21-2017 )
 * Let’s Encrypt for trusted HTTPS certificates.(  NEW 03-16-2017 )
 * Fail2Ban protection against brute force attacks. ( NEW 02-24-2017 )
 * UFW firewall ( NEW 07-02-2018 )
 * Dynamic DNS support for no-ip.org ( NEW 03-05-2017 )
 * Dynamic DNS support for freeDNS ( NEW 09-05-2017 )
 * Dynamic DNS support for duckDNS ( NEW 09-27-2017 )
 * Dynamic DNS support for spDYN ( NEW 11-12-2017 )
 * dnsmasq DNS server with DNS cache ( NEW 03-09-2017 )
 * ModSecurity Web Application Firewall ( NEW 03-23-2017 )
 * NFS ready to mount your files over LAN ( NEW 04-13-2017 )
 * SAMBA ready to share your files with Windows/Mac/Linux ( NEW 04-16-2017 )
 * USB automount ( NEW 05-24-2017 )
 * Remote updates ( NEW 03-31-2017 )
 * Autoumatic NCP updates ( NEW 08-16-2017 )
 * Automatic Nextcloud updates ( NEW 05-29-2018 )
 * Update notifications ( NEW 08-16-2017 )
 * NextCloud backup and restore ( NEW 05-24-2017 )
 * NextCloud online installation ( NEW 05-24-2017 )
 * Format USB drive to BTRFS ( NEW 07-03-2017 )
 * BTRFS snapshots ( NEW 04-12-2017 )
 * Automatic BTRFS snapshots ( NEW 07-02-2018 )
 * BTRFS snapshot auto sync ( NEW 19-03-2018 )
 * scheduled rsync ( NEW 19-03-2018 )
 * ZRAM ( NEW 19-03-2018 )
 * UPnP automatic port forwarding ( NEW 07-03-2017 )
 * Security audits with Lynis and Debsecan ( NEW 07-02-2018 )
 * ZRAM ( NEW 19-03-2018 )

Extras can be activated and configured using the web interface at HTTPS port 4443


![NCP-config](https://ownyourbits.com/wp-content/uploads/2017/07/web-letsencrypt.jpg)

, or from the command line from

```
sudo ncp-config
```

![NCP-config](https://ownyourbits.com/wp-content/uploads/2017/03/ncp-conf-700x456.jpg)


## How to build

Install git, docker, qemu-user-static, chroot and all the usual building tools.

```
git clone https://github.com/nextcloud/nextcloudpi.git
cd nextcloudpi
./build-SD-rpi.sh
```

, or for an Armbian based board

```
./build-SD-armbian.sh odroidxu4   # supported board code name
```

In order to generate the Docker images

```
git clone https://github.com/nextcloud/nextcloudpi.git
cd nextcloudpi
make                        # armhf version
make nextcloudpi-x86        # x86   version
```

NextCloudPi can be installed in any architecture running the latest Debian

```
# curl -sSL https://raw.githubusercontent.com/nextcloud/nextcloudpi/master/install.sh | bash
```

## Downloads

Get the image, find details and more instructions at

https://ownyourbits.com/2017/02/13/nextcloud-ready-raspberry-pi-image/

Pull the docker image

https://ownyourbits.com/2017/06/08/nextcloudpi-docker-for-raspberry-pi/

https://hub.docker.com/r/ownyourbits/nextcloudpi-x86

https://hub.docker.com/r/ownyourbits/nextcloudpi-armhf

## Contact

You can find us in the [forums](https://help.nextcloud.com/c/support/appliances-docker-snappy-vm) and a [Telegram group](https://t.me/NextCloudPi)
