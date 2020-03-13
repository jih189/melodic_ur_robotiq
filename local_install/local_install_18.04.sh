sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

curl -sSL 'http://keyserver.ubuntu.com/pks/lookup?op=get&search=0xC1CF6E31E6BADE8868B172B4F42ED6FBAB17C654' | sudo apt-key add -

sudo apt install ros-melodic-desktop-full

sudo rosdep init
rosdep update

sudo apt install python-rosinstall python-rosinstall-generator python-wstool build-essential

# Add in pip, python catkin build tools, etc.
apt-get update && apt-get install -y \
        ros-melodic-catkin \
        python3-pip python-pip \
        python-wstool \
        python-catkin-tools \
        vim \
        curl \
        tmux

# Add in required packages for ur5 and robotiq gripper
apt-get update && apt-get install -y \
        ros-melodic-joint-trajectory-controller \
        ros-melodic-joint-state-publisher \
        ros-melodic-joint-state-controller \
        ros-melodic-position-controllers \
        ros-melodic-moveit \
		ros-melodic-urdf \
        ros-melodic-soem \
        ros-melodic-ros-canopen \
        ros-melodic-geometry \
        ros-melodic-industrial-core

# Get newest version of gazebo 9
curl -sSL http://get.gazebosim.org | sh

# Install matplotlib
apt-get update && apt-get install -y \
        python-matplotlib

# Fixes ERROR message: gazebo-9.11.0: symbol lookup error: /usr/lib/x86_64-linux-gnu/libgazebo_common.so.9: undefined symbol: _ZN8ignition10fuel_tools12ClientConfig12SetUserAgentERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
# See https://bitbucket.org/osrf/gazebo/issues/2448/problem-running-gazebo7
apt update && apt upgrade -y \
        libignition-math2

# Add in gazebo ROS packages. Do this after Gazebo version update
# So gazebo 9.0 doesn't get installed first, followed by 9.9
apt-get update && apt-get install -y \
        ros-melodic-gazebo-ros-control \
        ros-melodic-gazebo-ros-pkgs \
        ros-melodic-gazebo-plugins \
        ros-melodic-gazebo-ros

# v4l2-ctl installed
apt-get update
apt-get install v4l-utils -y

apt-get update
apt-get install ros-melodic-moveit-visual-tools -y

apt-get update
apt-get install ros-melodic-rosparam-shortcuts -y


apt-get update
apt-get install ros-melodic-ros-control ros-melodic-ros-controllers -y

apt-get update
apt-get install libmodbus-dev -y

apt-get -y install ros-melodic-ddynamic-reconfigure

apt-get update

apt-get -y install ros-melodic-rqt ros-melodic-rqt-common-plugins ros-melodic-rqt-robot-plugins

apt-get -y install libcanberra-gtk3-module

# yolo
# RUN pip3 install torch==1.4.0+cpu torchvision==0.5.0+cpu -f https://download.pytorch.org/whl/torch_stable.html

# RUN pip3 install opencv-python
# RUN pip3 install matplotlib
# RUN pip3 install tqdm

# Add sourcing of catkin workspaces to .bashrc to run on startup
# echo "source /opt/ros/melodic/setup.bash" >> /home/$USER/.bashrc

# EXPOSE 11311
