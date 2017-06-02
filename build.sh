#!/bin/bash

set -e

#This lets us build arm images (with QEMU installed) on x86
docker run --rm --privileged multiarch/qemu-user-static:register --reset

docker build -t amouat/registry-reggie-x86_64 -f Dockerfile.x86_64 .
docker push amouat/registry-reggie-x86_64
docker build -t amouat/registry-reggie-armv7l -f Dockerfile.armv7l .
docker push amouat/registry-reggie-armv7l
#manifest thing
manifest pushml ./registry-reggie.yaml 
