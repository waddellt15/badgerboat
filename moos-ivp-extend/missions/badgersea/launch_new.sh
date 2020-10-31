#!/bin/bash -e

#Author: Taylor Waddell

shut_down() {
   sudo killall gpsd;
   sudo rm /var/run/gpsd.sock; 
   sudo kill $ros1;
   sudo kill $ros2;
   sudo kill $ros3;
   sudo -- -$$;
}

trap shut_down EXIT SIGTERM SIGHUP SIGINT SIGKILL

#IP of LiDAR
IP="169.254.86.243"

sudo ./launchscripts/gpsd.sh
#Roslaunch, needs to be updated with IP
sleep 1
gnome-terminal -- bash -c "./launchscripts/ros1.sh "${IP}
ros1=`pgrep -f ros1.sh`;
sleep 4
gnome-terminal -- bash -c "./launchscripts/ros2.sh"
ros2=`pgrep -f ros2.sh`;
sleep 4
gnome-terminal -- bash -c "./launchscripts/ros3.sh"
ros3=`pgrep -f ros3.sh`;

sudo pAntler badgersea.moos
