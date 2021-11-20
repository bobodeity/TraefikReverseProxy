#!/bin/sh

if [ -z "$1" ]; then
  echo "Please input arguments username."
  exit
fi

echo $(htpasswd -nB $1)
