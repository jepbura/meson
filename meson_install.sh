#!/bin/sh

cpu_arch="$(uname -m)"
echo "cpu_arch=$cpu_arch"
AMD="https://staticassets.meson.network/public/meson_cdn/v3.1.18/meson_cdn-linux-amd64.tar.gz"
ARM="https://staticassets.meson.network/public/meson_cdn/v3.1.18/meson_cdn-linux-arm64.tar.gz"

if [ "${cpu_arch}" = "x86_64" ]; then
DOWNLOADLINK=$AMD
FILENAME="meson_cdn-linux-amd64.tar.gz"
elif [[ "${cpu_arch}" = "arm64" ]] || [[ "${cpu_arch}" = "aarch64" ]]; then
DOWNLOADLINK=$ARM
FILENAME="meson_cdn-linux-arm64.tar.gz"
else
echo "Your CPU type dose not support" 
exit 1
fi

echo "DOWNLOADLINK=$DOWNLOADLINK"

if [ -d ./meson_cdn* ]; then
echo "meson_cdn found" &&
cd ./meson_cdn* &&
sudo ./service start meson_cdn
else
echo "meson_cdn NOT found."
sudo wget $DOWNLOADLINK &&
sudo tar -zxf $FILENAME &&
sudo rm -f $FILENAME &&
cd ./meson_cdn* &&
sudo ./service install meson_cdn  &&
sudo ./meson_cdn config set --token=$TOKEN --https_port=$PORT --cache.size=30 &&
sleep 30 && echo ' ____   ___  _   _ _____
|  _ \ / _ \| \ | | ____|
| | | | | | |  \| |  _|
| |_| | |_| | |\  | |___
|____/ \___/|_| \_|_____|'
sudo ./service start meson_cdn
fi

/bin/bash