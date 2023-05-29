#!/usr/bin/env sh

IDE_SERVER_VERSION="latest"
IDE_SERVER_PORT="4000"

if [ -n "$1" ]; then
  IDE_SERVER_VERSION=$1
fi

if [ -n "$2" ]; then
  IDE_SERVER_PORT=$2
fi

echo "Version: [$IDE_SERVER_VERSION]"
echo "Port: [$IDE_SERVER_PORT]"

docker run --detach --publish=$IDE_SERVER_PORT:4000 --network=host --name=test_container zcodeapp/ide-server:$IDE_SERVER_VERSION
sleep 5 # wait container start
echo "Success run container [test_container - zcodeapp/ide-server:$IDE_SERVER_VERSION - port $IDE_SERVER_PORT]"