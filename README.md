# ros2_docker
Docker for ROS2 workspace configuration.

1. Make a docker workspace directory for sharing files with the container.

		mkdir /home/$USERNAME/docker_ws

2. Build dockerfile (run below command at the directory with 'Dockerfile') (-t is tag option).

		docker build -t osrf/ros-foxy-user .

3. Run docker run command with options.

		docker run --gpus all -it --rm -v /tmp/.X11-unix:/tmp/.X11-unix -v /home/$USERNAME/docker_ws:/home/$USERNAME/docker_ws -e DISPLAY=$DISPLAY -e TZ=$(cat /etc/timezone) --env="NVIDIA_VISIBLE_DEVICES"=all --env="NVIDIA_DRIVER_CAPABILITIES"=all osrf/ros-foxy-user:latest
