# Image for UR5e with ROS Melodic, Gazebo9 and Ubuntu 18.04
* Ubuntu 18.04 (Bionic)
* ROS Melodic
* Gazebo 9.11

It is recommended to get Nvidia support through [rocker](https://github.com/osrf/rocker).

Set up Rocker

```bash
pip3 install git+https://github.com/osrf/rocker.git
pip3 install git+https://github.com/sloretz/off-your-rocker
```

The following steps outline how to build the docker image and then run the rocker command to start the container.

1. Build the docker image:

```bash
cd docker_image 
```

```bash 
build_image.sh
```

2. Run the rocker command to run a new container:

```bash
rocker --nvidia --x11 --user --home --pulse melodic-ur-robotiq:latest
```

NOTE: make sure you have rocker installed! 

Also, rocker doesn't allow the --rm command to remove the container after exiting, but if you install the add-on [off-your-rocker](https://github.com/sloretz/off-your-rocker), you can pass in standard docker arguments to rocker. For example, to utilize docker's --rm and --privileged options run:

```bash
rocker --oyr-run-arg " --rm --privileged" --nvidia --x11 --user --home --net host --pulse melodic-ur-robotiq:latest
```

#### NOTE: --net host is required to allow the UR5e to connect with the ROS UR Driver! It won't work without this option if you are using docker!!

#### Note: if you did not install install nvidia them you need to remote "--nvidia" from the launch_docker.sh    


In this branch, we include the driver with realsense camera. Because we are using D435, when you are trying to launch the node for it, please run following command:
```bash
roslaunch realsense2_camera rs_d435_camera_with_model.launch
```
#### Note: because camera permission is not given in the image, you need to use chmod to modify the permission for /dev/video0,1,2,3.
