#!/usr/bin/env sh

IDE_SERVER_VERSION="latest"
IDE_SERVER_PORT="4000"
IDE_SERVER_NETWORK="host"
IDE_SERVER_CONTAINER_NAME="test_container"
IDE_SERVER_KEY="355b5636-3c3e-4e57-97ad-5e1dd40283a2"
IDE_RATE_POINTS="5"
IDE_RATE_DURATION="600"

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
if [ -n "$5" ]; then
  IDE_SERVER_KEY=$5
fi
if [ -n "$6" ]; then
  IDE_RATE_POINTS=$6
fi
if [ -n "$7" ]; then
  IDE_RATE_DURATION=$7
fi

echo "Version: [$IDE_SERVER_VERSION]"
echo "Port: [$IDE_SERVER_PORT]"

docker run \
  --detach \
  --env SERVER_KEY=$IDE_SERVER_KEY \
  --env PORT=$IDE_SERVER_PORT \
  --env RATE_POINTS=$IDE_RATE_POINTS \
  --env RATE_DURATION=$IDE_RATE_DURATION \
  --publish=$IDE_SERVER_PORT:4000 \
  --network=$IDE_SERVER_NETWORK \
  --name=$IDE_SERVER_CONTAINER_NAME \
  zcodeapp/ide-server:$IDE_SERVER_VERSION

sleep 5
echo "Success run container \ 
  [container ($IDE_SERVER_CONTAINER_NAME) - \
  image (zcodeapp/ide-server:$IDE_SERVER_VERSION) - \
  port ($IDE_SERVER_PORT) - \
  network ($IDE_SERVER_NETWORK) - \
  rate points ($IDE_RATE_POINTS) - \
  rate duration ($IDE_RATE_DURATION) - \
  key ($IDE_SERVER_KEY)]"