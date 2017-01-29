#!/bin/bash

cd /usr/share/nginx/html/
wget -O image.iso $ISO
bsdtar xfp image.iso

nginx -g "daemon off;"