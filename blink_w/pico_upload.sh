#!/bin/bash

if [ $(id -u) -ne 0 ]; then exec sudo bash "$0" "$@"; exit; fi

PROJ_NAME=$(basename $(dirname $(realpath $0)))

echo "Uploading ${PROJ_NAME}.uf2..."

sudo cp build/${PROJ_NAME}.uf2 /media/ubuntu/RPI-RP2 &&
sudo sync &&

echo "Uploading complete!"
