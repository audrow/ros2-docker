FROM ubuntu:jammy

ENV DEBIAN_FRONTEND=noninteractive
ENV ROS2_WS=/ros2_ws
ENV ROS_PYTHON_VERSION=3

SHELL ["/bin/bash", "-c"]

RUN \
	apt-get update \
	&& \
	apt-get install -y software-properties-common \
	&& \
	add-apt-repository universe -y \
	&& \
	apt-get update \
	&& \
	apt-get install -y curl gnupg lsb-release \
	&& \
	curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg \
	&& \
	echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(source /etc/os-release && echo $UBUNTU_CODENAME) main" | tee /etc/apt/sources.list.d/ros2.list > /dev/null \
	&& \
	apt-get update \
	&& \
	apt-get install -y \
    build-essential \
    cmake \
    git \
    python3-colcon-common-extensions \
    python3-flake8 \
    python3-flake8-blind-except \
    python3-flake8-builtins \
    python3-flake8-class-newline \
    python3-flake8-comprehensions \
    python3-flake8-deprecated \
    python3-flake8-docstrings \
    python3-flake8-import-order \
    python3-flake8-quotes \
    python3-pip \
    python3-pytest \
    python3-pytest-cov \
    python3-pytest-repeat \
    python3-pytest-rerunfailures \
    python3-rosdep \
    python3-setuptools \
    python3-vcstool \
    wget \
	&& \
	rm -rf /var/lib/apt/lists/*

RUN \
	apt-get update \
	&& \
	rosdep init \
	&& \
	rosdep update \
	&& \
	rm -rf /var/lib/apt/lists/*

RUN \
  python3 -m pip install --upgrade pip bloom \
	&& \
	rm -rf /var/lib/apt/lists/*

RUN \
  echo -e '#!/bin/bash\nbloom-release $@' > /usr/bin/br && chmod +x /usr/bin/br \
  && \
  echo -e '#!/bin/bash\nbr --non-interactive -r rolling $@' > /usr/bin/brr && chmod +x /usr/bin/brr \
  && \
  echo -e '#!/bin/bash\nbr --non-interactive -r humble $@' > /usr/bin/brh && chmod +x /usr/bin/brh
