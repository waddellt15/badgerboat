#! /bin/bash

# ip address of lidar
IP=192.168.137.218
# location of MOOS misison
MF=~/moos/moos-ivp-extend/missions/boat

# Start the LIDAR
xterm -e roslaunch sick_scan sick_tim_7xx.launch hostname:=$IP &

# start clustering program
xterm -e roslaunch laser_values laser.launch & 

# start MOOS-ROS bridge
xterm -e ~/catkin_ws/src/moos-ros-bridge/scripts/counter.sh &

# start MOOS in new terminal
cd $MF
pAntler boat.moos & 

wait
