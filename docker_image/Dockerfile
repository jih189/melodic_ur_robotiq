FROM ros:melodic
# Add in pip, python catkin build tools, etc.
RUN apt-get update && apt-get install -y \
        ros-melodic-catkin \
        python3-pip python-pip \
        python-wstool \
        python-catkin-tools \
        vim \
        curl \
        tmux && \
    rm -rf /var/lib/apt/lists/*

# Add in required packages for ur5 and robotiq gripper
RUN apt-get update && apt-get install -y \
        ros-melodic-joint-trajectory-controller \
        ros-melodic-joint-state-publisher \
        ros-melodic-joint-state-controller \
        ros-melodic-position-controllers \
        ros-melodic-moveit \
		ros-melodic-urdf \
        ros-melodic-soem \
        ros-melodic-ros-canopen \
        ros-melodic-geometry \
        ros-melodic-industrial-core && \
    rm -rf /var/lib/apt/lists/*

# Get newest version of gazebo 9
RUN curl -sSL http://get.gazebosim.org | sh

# Install matplotlib
RUN apt-get update && apt-get install -y \
        python-matplotlib && \
    rm -rf /var/lib/apt/lists/*

# Fixes ERROR message: gazebo-9.11.0: symbol lookup error: /usr/lib/x86_64-linux-gnu/libgazebo_common.so.9: undefined symbol: _ZN8ignition10fuel_tools12ClientConfig12SetUserAgentERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
# See https://bitbucket.org/osrf/gazebo/issues/2448/problem-running-gazebo7
RUN apt update && apt upgrade -y \
        libignition-math2 && \
    rm -rf /var/lib/apt/lists/*

# Add in gazebo ROS packages. Do this after Gazebo version update
# So gazebo 9.0 doesn't get installed first, followed by 9.9
RUN apt-get update && apt-get install -y \
        ros-melodic-gazebo-ros-control \
        ros-melodic-gazebo-ros-pkgs \
        ros-melodic-gazebo-plugins \
        ros-melodic-gazebo-ros && \
    rm -rf /var/lib/apt/lists/*

# v4l2-ctl installed
RUN apt-get update
RUN apt-get install v4l-utils -y

RUN apt-get update
RUN apt-get install ros-melodic-moveit-visual-tools -y

RUN apt-get update
RUN apt-get install ros-melodic-rosparam-shortcuts -y


RUN apt-get update
RUN apt-get install ros-melodic-ros-control ros-melodic-ros-controllers -y

RUN apt-get update
RUN apt-get install libmodbus-dev -y

# Add sourcing of catkin workspaces to .bashrc to run on startup
RUN echo "source /opt/ros/melodic/setup.bash" >> /home/$USER/.bashrc
