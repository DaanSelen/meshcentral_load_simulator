#!/bin/bash

if ! command -v docker > /dev/null; then
    echo "Docker is not installed, aborting!"
fi

if [[ -z "$1" ]]; then
    echo "Please use the amount of agents you want to simulate. or 'kill' to stop all"
    echo "For example: ./$0 100 ..."
    exit 1
fi

if [[ "$1" == "kill" ]]; then
    docker ps -aq --filter 'name=meshagent' | xargs -r docker rm -f
    echo "Clearing rememberability..."
    echo '' > ./laststate.txt
    exit 0
fi

if [[ -z "$2" ]]; then
    echo "Pleae use the Docker image name available to the Docker daemon."
    echo "For example: ./$0 100 meshagent-image:latest"
    exit 1
fi

desired_amount="$1"
echo "Desired: $desired_amount "

if [[ -f ./laststate.txt ]]; then
    last_content=$(cat ./laststate.txt)

    if [[ -n "$last_content" ]]; then
        echo "Assuming existence of $last_content agents..."
    else
        echo "Assuming no previous agents running..."
    fi

    if [[ -n "$last_content" ]]; then
        echo "Setting init_incrm"
        init_incrm=$last_content
        desired_amount=$((desired_amount - init_incrm))
    fi
fi

echo "Deploying: $desired_amount agents"
agent_num="0"

echo "----- Generating Some Art -----"
for i in $(seq 1 "$desired_amount"); do
    if [[ -n "$init_incrm" ]]; then
        agent_num=$(("$init_incrm" + "$i"))
    else
        agent_num="$i"
    fi

    docker run --name meshagent-$agent_num -d $2
done
echo "----- Done Generating Art -----"

echo "Trying to make state rememberable..."
final_agent_num=$((init_incrm + $desired_amount))
echo "$final_agent_num" > ./laststate.txt
