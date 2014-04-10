#!/bin/bash

PACKAGE_NAME="cc2530prog-ninja"
DESCRIPTION="ZigBee CC2530 SOC programmer"
ARCH="armhf"
PACKAGE_VERSION="0.0.1"
FULL_PACKAGE_NAME="${PACKAGE_NAME}_${PACKAGE_VERSION}_${ARCH}.deb"

mkdir -p dist
mkdir -p fs/usr/local/bin
make
cp cc2530prog fs/usr/local/bin

echo "Creating the package ${FULL_PACKAGE_NAME}"
fpm -s dir -t deb \
-n ${PACKAGE_NAME} -v ${PACKAGE_VERSION} \
--deb-compression xz --deb-user root --deb-group root \
-m "Builder <builder@ninjablocks.com>" --url http://ninjablocks.com/ \
--description "${DESCRIPTION}" -C fs -a $ARCH \
-p dist/${FULL_PACKAGE_NAME} usr/

