#!/usr/bin/env sh

set -e
set -o errexit
set -o nounset

IDE_SERVER_VERSION=$1
IDE_SERVER_PORT=$2

if [ -z "$IDE_SERVER_VERSION" ]; then
  echo ""
  echo "Missing IDE Server version in the [ide-server-version] input. Received value: $IDE_SERVER_VERSION"
  echo ""

  exit 2
fi

if [ -z "$IDE_SERVER_PORT" ]; then
  echo ""
  echo "Missing IDE Server port in the [ide-server-port] input. Received value: $IDE_SERVER_PORT"
  echo ""

  exit 2
fi

docker run --detach --publish=$IDE_SERVER_PORT:4000 --name=test_container zcodeapp/ide-server:$IDE_SERVER_VERSION
sleep 5 # wait container start
echo "Success run container [test_container - zcodeapp/ide-server:$IDE_SERVER_VERSION - port $IDE_SERVER_PORT]"