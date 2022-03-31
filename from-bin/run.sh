#!/bin/bash
xhost +local:
docker run -it --net=host \
  -e DISPLAY=$DISPLAY \
  -e QT_GRAPHICSSYSTEM=native \
  -v "/tmp/.X11-unix:/tmp/.X11-unix" \
  -v ros2_ws:/ros2_ws \
  --device=/dev/dri:/dev/dri \
  rolling:dev

