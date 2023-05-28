#!/usr/bin/env sh

set -e
set -o errexit
set -o nounset

IDE_SERVER_VERSION=$1 || "latest"
IDE_SERVER_PORT=$2 || "4000"

docker run --detach --publish=$IDE_SERVER_PORT:4000 --name=test_container zcodeapp/ide-server:$IDE_SERVER_VERSION
sleep 5 # wait container start
echo "Success run container [test_container - zcodeapp/ide-server:$IDE_SERVER_VERSION - port $IDE_SERVER_PORT]"