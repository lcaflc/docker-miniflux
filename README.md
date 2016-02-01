Improved Miniflux Docker image
==============================

This is an improved docker image for Miniflux.

Miniflux
--------

Miniflux is a minimalist and web-based RSS reader.
Project Homepage is here: <https://miniflux.net/>.

Features
--------

This image is build on top of official [docker php image](https://hub.docker.com/_/php/). Curently using php:5-apache branch.

Like the official image it features integrated sqlite database and is self contained. Data persistence is provided using a docker VOLUME (see documentation above).

This image curently track only HEAD on miniflux master branch. Tracking of released versions will come in the near future.

Also to be included in the near future is the integration in this image of various miniflux themes available, at least all the official ones.

Usage
-----

Usage remains as simple as official image

For immediate testing:
```bash
docker run -d --name miniflux -p 80:80 -t lcaflc/miniflux:latest
```

Using persistence volume need that data folder initialised before and have the correct credentials:
```bash
MF_DATA=~/miniflux-data
cd /tmp
curl -o - https://codeload.github.com/miniflux/miniflux/tar.gz/master | tar zxvf - miniflux-master/data
mv miniflux-master/data $MF_DATA
chmod -R og+rX $MF_DATA
chown -R 33:33 $MF_DATA
docker run -d --name miniflux -v ${MF_DATA}:/var/www/html/data -p 80:80 -t lcaflc/miniflux:latest
```
