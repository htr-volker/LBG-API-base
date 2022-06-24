#!/bin/bash

# set variables
app_name=lbg-api-app
dockerhub_username=htrvolker
tag=latest
image_name=${dockerhub_username}/${app_name}:${tag}
container_port=5000

# build the docker image
echo "Building image:"
docker build -t $image_name .
echo

# push image to dockerhub
echo "Pushing image:"
docker push $image_name
echo

# stop and remove running instance of the app
echo "Removing running container:"
docker stop $app_name
docker rm $app_name
echo

# running the container published to port 80 on the host machine
echo "Running new container:"
docker run -d -p 80:$container_port -e PORT=$container_port --name $app_name $image_name
echo
