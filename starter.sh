#!/bin/bash
#
##
  cd $HOME/$DIR
  if [[ $MODULE = "$null" ]]; then
    aws s3 ls
    geany $HOME/$DIR
  else
    $MODULE
  fi

