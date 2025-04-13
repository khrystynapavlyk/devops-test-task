#!/bin/bash

DOCKER_NETWORK_NAME=dev-network
DOCKER_IMAGE_NAME=custom_nginx
DOCKER_IMAGE_TAG=latest
DOCKER_CONTAINER_NAME=nginx

network_exists=$(docker network ls | grep $DOCKER_NETWORK_NAME | awk '{print $2}')
if [ -z "$network_exists" ]; then
  echo "Network $DOCKER_NETWORK_NAME does not exist. Creating network..."
  docker network create $DOCKER_NETWORK_NAME
else
  echo "Network $DOCKER_NETWORK_NAME already exists. Skipping creation..."
fi

echo "Building Docker image..."
docker build -t custom_nginx:latest .

echo "Stopping and removing existing container..."
docker stop $DOCKER_CONTAINER_NAME || true
docker rm $DOCKER_CONTAINER_NAME || true

echo "Running Docker container..."
docker run -d \
  --name $DOCKER_CONTAINER_NAME \
  --network $DOCKER_NETWORK_NAME \
  --restart always \
  -p 8080:80 \
  --health-cmd="curl -f http://localhost || exit 1" \
  --health-interval=30s \
  --health-timeout=10s \
  --health-retries=3 \
  --health-start-period=5s \
  custom_nginx:latest
