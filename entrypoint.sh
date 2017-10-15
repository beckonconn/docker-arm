#!/bin/bash

if [[ ! -d ${DATA_DIR} ]]; then
  cp /etc/bind/* ${DATA_DIR}
fi

# Move original bind dir out of the way and allows for mounted /data to hold configuration files
mv /etc/bind /etc/bind.orig
ln -sf ${DATA_DIR} /etc/bind
chmod -R 0775 ${DATA_DIR}
