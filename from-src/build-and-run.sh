#!/bin/bash

docker build -t rolling:dev-src . && docker run -it rolling:dev-src
