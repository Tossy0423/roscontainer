FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Tokyo
ENV LANG=en_US.UTF-8

SHELL ["/bin/bash", "-c"] 
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    curl \
    gnupg \
    lsb-release \
    tzdata \
    python3 \
    python3-dev \
    python3-pip \
    software-properties-common \
    && python3 -m pip install --upgrade pip \ 
    && curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(source /etc/os-release && echo $UBUNTU_CODENAME) main" | tee /etc/apt/sources.list.d/ros2.list > /dev/null \
    && apt-get update \
    && apt-get install -y \
    python3-colcon-common-extensions \
    ros-humble-desktop-full \
    ros-humble-gazebo-* \
    ros-humble-rqt-* \
    && echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc \
    && source ~/.bashrc \
    && apt-get clean \
    && rm -rf /var/lib/apt-get/lists/*
