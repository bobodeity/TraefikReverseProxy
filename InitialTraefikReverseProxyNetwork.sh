#!/bin/sh

TRAEFIK_NETWORK_NAME=$1

if [ -z "$1" ]; then
  TRAEFIK_NETWORK_NAME=TraefikReverseProxy
fi

docker network rm $TRAEFIK_NETWORK_NAME 2> /dev/null

docker network create $TRAEFIK_NETWORK_NAME
