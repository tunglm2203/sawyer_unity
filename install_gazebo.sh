#!/usr/bin/env bash
# This script installs Sawyer Simulator (Gazebo) on Ubuntu 18.04
# This installation is based on page: https://support.rethinkrobotics.com/support/solutions/articles/80000980134-workstation-setup
# If you have any problem, please visit above page for more information
# NOTE: Run this file without root permission (do not use 'sudo')

sudo apt-get install -y gazebo9 ros-melodic-qt-build ros-melodic-gazebo-ros-control \
  ros-melodic-gazebo-ros-pkgs ros-melodic-ros-control ros-melodic-control-toolbox ros-melodic-realtime-tools \
  ros-melodic-ros-controllers ros-melodic-xacro python-wstool ros-melodic-tf-conversions ros-melodic-kdl-parser


# Install sawyer_simulator
cd ~/ros_ws/src
git clone https://github.com/RethinkRobotics/sawyer_simulator.git
git clone https://github.com/RethinkRobotics-opensource/sns_ik.git -b melodic-devel

cd ~/ros_ws/src
wstool init .
wstool merge sawyer_simulator/sawyer_simulator.rosinstall
wstool update

# Build Source
source /opt/ros/kinetic/setup.bash
cd ~/ros_ws
catkin_make -j4
echo -en "\nInstall Gazebo complete!\n Refer: https://support.rethinkrobotics.com/support/solutions/articles/80000980381-gazebo-tutorial for checking successful installation.\n"

