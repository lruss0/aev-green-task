#!/bin/bash

DOCKERFILE="2b.Dockerfile.node"
IMAGE_NAME="npm-test"

if [ -x "$(command -v docker)" ]; then
    docker build --tag $IMAGE_NAME -f $DOCKERFILE .
    docker run -d $IMAGE_NAME
    docker ps | grep $IMAGE_NAME
else
    echo "Sorry, docker is not present in your system :("
fi