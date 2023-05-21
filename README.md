# Meson for Docker
Simple Docker to install Meson as a Docker platform.

## Usage

Define the following environment variable to configure Meson.

Variable | Description | Optional
-------- | ----------- | --------
TOKEN | Your token on Meson | no
PORT | Specify the port for Meson | no
CACHE_SIZE | Your system cache size | 30

## For example

`docker run -d -p 9222:9222 -e TOKEN=xxxxxxxxx -e PORT=9222 --name meson jepbura/meson:latest`

## Docker hub

My Docker at Docker Hub: [jepbura/meson](https://hub.docker.com/r/jepbura/meson/)
