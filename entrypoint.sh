#!/bin/bash

if [[ ! -d ${DATA_DIR} ]]; then
  cp -R /etc/bind ${DATA_DIR}
fi

mv /etc/bind /etc/bind.orig
ln -sf /etc/bind ${DATA_DIR}
chmod -R 0775 ${DATA_DIR}
