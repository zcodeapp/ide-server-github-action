#!/usr/bin/env sh

IDE_SERVER_VERSION="latest"
IDE_SERVER_PORT="4000"
IDE_SERVER_NETWORK="host"
IDE_SERVER_CONTAINER_NAME="test_container"

if [ -n "$1" ]; then
  IDE_SERVER_VERSION=$1
fi
if [ -n "$2" ]; then
  IDE_SERVER_PORT=$2
fi
if [ -n "$3" ]; then
  IDE_SERVER_NETWORK=$3
fi
if [ -n "$4" ]; then
  IDE_SERVER_CONTAINER_NAME=$4
fi

echo "Version: [$IDE_SERVER_VERSION]"
echo "Port: [$IDE_SERVER_PORT]"

docker run --detach --publish=$IDE_SERVER_PORT:4000 --network=$IDE_SERVER_NETWORK --name=$IDE_SERVER_CONTAINER_NAME zcodeapp/ide-server:$IDE_SERVER_VERSION
sleep 5
echo "Success run container [$IDE_SERVER_CONTAINER_NAME - zcodeapp/ide-server:$IDE_SERVER_VERSION - port $IDE_SERVER_PORT - network $IDE_SERVER_NETWORK]"