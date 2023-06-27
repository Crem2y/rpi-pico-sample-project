#!/bin/bash

if [ $(id -u) -ne 0 ]; then exec sudo bash "$0" "$@"; exit; fi

echo "Uploading..."

sudo cp build/myapp.uf2 /media/ubuntu/RPI-RP2 &&
sudo sync &&

echo "Uploading complete!"
