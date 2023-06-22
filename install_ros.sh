#!/usr/bin/env bash
# This script installs ROS on Ubuntu 18.04
# This installation is based on page: https://support.rethinkrobotics.com/support/solutions/articles/80000980134-workstation-setup
# If you have any problem, please visit above page for more information
# NOTE: Run this file without root permission (do not use 'sudo')

## INSTALL ROS
# Setup your sources.list
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

# Setup your keys
sudo apt install -y curl # if you haven't already installed curl
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -

# Update to Latest Software Lists
sudo apt-get update

# Install ROS Melodic Desktop Full
sudo apt-get install ros-melodic-desktop-full

# Dependencies for building packages
sudo apt-get install -y python-rosdep python-rosinstall python-rosinstall-generator python-wstool build-essential

# Initialize rosdep (rosdep enables you to easily install system dependencies for source you want to compile and is required to run some core components in ROS)
sudo rosdep init
rosdep update

# Create ROS Workspace (note: `ros_ws` is equivalent to `catkin_workspace` in ROS world)
mkdir -p ~/ros_ws/src

# Source ROS Setup
source /opt/ros/melodic/setup.bash
# Build workspace
cd ~/ros_ws
catkin_make
echo -en "\nInstall ROS complete! \n Please install intera SDK next.\n"

