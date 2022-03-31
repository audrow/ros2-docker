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
		python3-pip \
		python3-pytest-cov \
		python3-rosdep \
		python3-setuptools \
		python3-vcstool \
		wget \
	&& \
	python3 -m pip install \
		flake8-blind-except \
		flake8-builtins \
		flake8-class-newline \
		flake8-comprehensions \
		flake8-deprecated \
		flake8-docstrings \
		flake8-import-order \
		flake8-quotes \
		pytest-repeat \
		pytest-rerunfailures \
		pytest \
	&& \
	rm -rf /var/lib/apt/lists/*


RUN \
	mkdir -p ${ROS2_WS}/src \
	&& \
	cd ${ROS2_WS} \
	&& \
	wget https://raw.githubusercontent.com/ros2/ros2/master/ros2.repos \
	&& \
	vcs import src < ros2.repos

WORKDIR ${ROS2_WS}
RUN \
	apt-get update \
	&& \
	rosdep init \
	&& \
	rosdep update \
	&& \
	rosdep install --from-paths src --ignore-src -y --skip-keys "fastcdr rti-connext-dds-6.0.1 urdfdom_headers" \
	&& \
	rm -rf /var/lib/apt/lists/*


RUN \
	colcon build --symlink-install
