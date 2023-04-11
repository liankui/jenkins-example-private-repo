#!/bin/bash
pwd=$(cd $(dirname $0); pwd)
ubuntu20Dir=$pwd/linux-amd64-ubuntu-20_04
remotePrefix=registry.cosec.tech:5000
baseImageName=abfuzz-javafuzz-java-linux-amd64-ubuntu-20_04

imagesSuffix=(
  base
  jdk-8
  jdk-11
  jdk-17
  openjdk-8
  openjdk-11
  openjdk-17
)

set -ex
for element in "${imagesSuffix[@]}"; do
  docker build -t $remotePrefix/$baseImageName:$element -f Dockerfile-$element $pwd
  docker push $remotePrefix/$baseImageName:$element
done
