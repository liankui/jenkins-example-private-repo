#!/bin/bash
pwd=$(cd $(dirname $0); pwd)
version=$(cat $(dirname $pwd)/version)
ubuntu20Dir=$pwd/linux-amd64-ubuntu-20_04
remotePrefix=registry.cosec.tech:5000
baseImageName=abfuzz-javafuzz-java-linux-amd64-ubuntu-20_04

imagesSuffix=(
  jdk-8
  jdk-11
  jdk-17
  openjdk-8
  openjdk-11
  openjdk-17
)

set -ex
for element in "${imagesSuffix[@]}"; do
  imageName=$baseImageName-$element
  docker build --build-arg IMAGE_NAME=$remotePrefix/$baseImageName --build-arg IMAGE_TAG=$element -t $imageName:latest -f $ubuntu20Dir/Dockerfile-build $ubuntu20Dir
    docker tag $imageName:latest $remotePrefix/$imageName:latest
    docker tag $remotePrefix/$imageName:latest $remotePrefix/$imageName:$version
    docker push $remotePrefix/$imageName:latest
    docker push $remotePrefix/$imageName:$version
done
