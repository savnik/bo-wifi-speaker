#!/bin/bash

echo "INSTALL Script 1"

sudo apt-get update -y
sudo apt-get upgrade -y

sudo apt-get install build-essential git autoconf automake libtool libdaemon-dev libasound2-dev libpopt-dev libconfig-dev avahi-daemon libavahi-client-dev libssl-dev -y

# Uncomment line in file
$infile = "/boot/config.txt"
$patern = "dtparam=audio=on"
sudo sed "s/$pattern/#$pattern/" < $infile

# Add line to end of file
sudo echo "dtoverlay=iqaudio-dacplus" >> /boot/config.txt

echo "END OF INSTALL SCRIPT 1... REBOOT"
sudo reboot
