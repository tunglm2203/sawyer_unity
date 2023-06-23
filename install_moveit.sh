#!/usr/bin/env bash
# This script installs MoveIt on Ubuntu 18.04
# This installation is based on page: https://support.rethinkrobotics.com/support/solutions/articles/80000980134-workstation-setup
# If you have any problem, please visit above page for more information
# NOTE: Run this file without root permission (do not use 'sudo')

# Make sure to update your sources
sudo apt-get update

# Install MoveIt!
sudo apt-get install -y ros-melodic-moveit

# Installing and building sawyer MoveIt Repo
cd ~/ros_ws
./intera.sh sim
cd ~/ros_ws/src
wstool merge https://raw.githubusercontent.com/tunglm2203/sawyer_moveit/master/sawyer_moveit.rosinstall
wstool update
cd ~/ros_ws
catkin_make -j4
echo -en "\nInstall MoveIT complete!\nRefer: https://support.rethinkrobotics.com/support/solutions/articles/80000980338-moveit-tutorial for more setting.\n"

