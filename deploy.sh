#!/bin/bash

if ! command -v docker > /dev/null; then
    echo "Docker is not installed, aborting!"
fi

if [[ -z $1 ]]; then
    echo "Please use the amount of agents you want to simulate."
    echo "For example: ./$0 100 ..."
    exit 1
fi

if [[ -z $2 ]]; then
    echo "Pleae use the Docker image name available to the Docker daemon."
    echo "For example: ./$0 100 meshagent-image:latest"
    exit 1
fi

for i in $(seq 1 "$1"); do
    docker run -d $2
done
