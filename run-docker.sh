#!/bin/bash

imageName="openssl-ubuntu"
containerName="openssl-container"
SSLPath=$(pwd)

docker build -t $imageName .
docker run --rm -it --name $containerName -v "${SSLPath}/SSL-Output:/SSL-Output" $imageName