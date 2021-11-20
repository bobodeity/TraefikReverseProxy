#!/bin/sh

ACME_FILEPATH=./conf/acme.json

if [ -e $ACME_FILEPATH ]; then
  rm -f $ACME_FILEPATH
fi

touch $ACME_FILEPATH

chmod 400 $ACME_FILEPATH
