FROM osrf/ros:foxy-desktop

RUN apt-get update
RUN apt-get install -y git
RUN apt-get -y install sudo

RUN apt-get -y install python3-pip
RUN apt-get -y install python3-tk

RUN apt-get -y install nano
RUN apt-get -y install tmux

RUN apt-get -y install ros-foxy-gps-tools
RUN apt-get -y install ros-foxy-automotive-platform-msgs
RUN apt-get -y install ros-foxy-plotjuggler-ros
RUN apt-get -y install ros-foxy-eigen-stl-containers
RUN apt-get -y install libyaml-cpp-dev

# for Daegyu's localization
RUN apt-get -y install libgeographic-dev

ENV USERNAME seong
RUN useradd -U -ms /bin/bash $USERNAME \
 && echo "$USERNAME:$USERNAME" | chpasswd # password is same with USERNAME
RUN echo "$USERNAME ALL=(ALL:ALL) ALL" > /etc/sudoers

RUN rosdep update

RUN echo "# for ROS2" >> /home/$USERNAME/.bashrc
RUN echo "source /home/$USERNAME/docker_ws/ros2/dev_ws/install/setup.bash" >> /home/$USERNAME/.bashrc

RUN echo "alias eb='nano /home/$USERNAME/.bashrc'" >> /home/$USERNAME/.bashrc
RUN echo "alias sb='source /home/$USERNAME/.bashrc'" >> /home/$USERNAME/.bashrc
RUN echo "alias ws='cd /home/$USERNAME/docker_ws/ros2/dev_ws'" >> /home/$USERNAME/.bashrc
RUN echo "alias cb='cd /home/$USERNAME/docker_ws/ros2/dev_ws && colcon build'" >> /home/$USERNAME/.bashrc
RUN echo "alias si='. /home/$USERNAME/docker_ws/ros2/dev_ws/install/setup.bash'" >> /home/$USERNAME/.bashrc

RUN /bin/bash -c "source /home/$USERNAME/.bashrc"

USER $USERNAME

# RUN /bin/bash -c "cd $HOME/docker_ws/ros2/dev_ws"
# RUN rosdep install --from-paths src/external/rviz_visual_tools --ignore-src --rosdistro ${ROS_DISTRO}

# RUN apt install -y libmatio-dev
# RUN cd /home/$USERNAME
# RUN git clone https://github.com/dic-iit/matio-cpp
# RUN cd matio-cpp
# RUN mkdir build && cd build
# RUN cmake ../
# RUN make
# RUN make install
