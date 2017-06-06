#!/bin/bash

set -e

#This lets us build arm images (with QEMU installed) on x86
docker run --rm --privileged multiarch/qemu-user-static:register --reset

docker build -t containersol/registry-wolf-x86_64 -f Dockerfile.x86_64 .
docker push containersol/registry-wolf-x86_64
docker build -t containersol/registry-wolf-armv7l -f Dockerfile.armv7l .
docker push containersol/registry-wolf-armv7l
#manifest thing
manifest pushml ./registry-wolf.yaml 
