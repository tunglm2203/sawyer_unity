### Script to install ROS for Sawyer Rethinking (This branch is used for Ubuntu 18.04 - ROS Melodic).
Reference: https://support.rethinkrobotics.com/support/solutions/articles/80000980134-workstation-setup#Install-Ubuntu

Run orders:

```
./install_ros.sh
./install_intera_sdk.sh
./install_gazebo.sh
./install_moveit.sh
```

Add two lines below into ~/.bashrc to activate ROS everytime you login:
```
source /opt/ros/melodic/setup.bash
source ~/ROS_WS/devel/setup.bash
```
ROS_WS is path to your ROS's workspace (example: ros_ws, catkin_ws, etc.)
