#!/bin/bash
#
  project=${PWD##*/}
##
  module=$1
  if [[ $1 = "build" ]]; then
    docker build -t ${project} .
    module=$2
  elif [[ $1 = "push" ]]; then
    dex push ${project}
    exit
  fi
  docker run -it --rm \
    -v $HOME/my:/root/my \
    -v $HOME:/data \
    -v /root/.aws \
    ${project} ${module}
##
