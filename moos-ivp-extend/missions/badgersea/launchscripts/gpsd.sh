#!/bin/bash
echo "Boat go brrrrrrr"
sudo systemctl stop gpsd.socket
sudo systemctl disable gpsd.socket
gpsd /dev/garmingps -S 4000 -F /var/run/gpsd.sock
