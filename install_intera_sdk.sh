#!/usr/bin/env bash
# This script installs Intera SDK & Robot SDK on Ubuntu 18.04
# This installation is based on page: https://support.rethinkrobotics.com/support/solutions/articles/80000980134-workstation-setup
# If you have any problem, please visit above page for more information
# NOTE: Run this file without root permission (do not use 'sudo')

## INSTALL INTERA SDK DEPENDENCIES
# Install SDK Dependencies
sudo apt-get update
sudo apt-get install -y git-core python-argparse python-wstool python-vcstools python-rosdep ros-melodic-control-msgs ros-melodic-joystick-drivers ros-melodic-xacro ros-melodic-tf2-ros ros-melodic-rviz ros-melodic-cv-bridge ros-melodic-actionlib ros-melodic-actionlib-msgs ros-melodic-dynamic-reconfigure ros-melodic-trajectory-msgs ros-melodic-rospy-message-converter

## INSTALL INTERA ROBOT SDK
# Download the SDK on your Workstation
cd ~/ros_ws/src
wstool init .
git clone https://github.com/RethinkRobotics/sawyer_robot.git
wstool merge sawyer_robot/sawyer_robot.rosinstall
wstool update

#Source ROS Setup
source /opt/ros/melodic/setup.bash

# Build workspace
cd ~/ros_ws
catkin_make -j4

# Copy the intera.sh script
cp ~/ros_ws/src/intera_sdk/intera.sh ~/ros_ws

# Move to ros workspace
cd ~/ros_ws
echo -en "\nInstall Intera SDK complete! \nRefer: https://support.rethinkrobotics.com/support/solutions/articles/80000980134-workstation-setup#Install-Intera-SDK-Dependencies for modifying intera.sh\n"

