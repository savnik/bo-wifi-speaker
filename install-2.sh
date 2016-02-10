#!/bin/bash

echo "INSTALL SCRIPT 2"

sudo apt-get install -y libasound2-plugin-equal

sudo echo asound-config.txt >> /etc/asound.conf

$infile = "/etc/rc.local"
$pattern = "exit 0"
sudo sed "s/$pattern/#$pattern/" < $infile

echo "sudo /home/pi/plainamp -e &" >> /etc/rc.local
echo "exit 0"

sudo git clone https://github.com/mikebrady/shairport-sync.git

cd shairport-sync/
sudo git checkout development
autoreconf -i -f
sudo ./configure --with-alsa --with-avahi --with-ssl=openssl --with-metadata  --with-systemd
sudo make
sudo getent group shairport-sync &>/dev/null || sudo groupadd -r shairport-sync >/dev/null
sudo getent passwd shairport-sync &> /dev/null || sudo useradd -r -M -g shairport-sync -s /usr/bin/nologin -G audio shairport-sync >/dev/null
sudo make install

echo "Install script 2 done... Rebooting"
sudo reboot
