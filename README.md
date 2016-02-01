Improved Miniflux Docker image
==============================

Miniflux
--------

Miniflux is a minimalist and web-based RSS reader.
Project Homepage is here: <https://miniflux.net/>.

Features
--------

[![](https://badge.imagelayers.io/lcaflc/miniflux:latest.svg)](https://imagelayers.io/?images=lcaflc/miniflux:latest 'Get your own badge on imagelayers.io')

This image is build on top of official [docker php image](https://hub.docker.com/_/php/). Curently using php:5-apache branch.

Like the official image it features integrated sqlite database and is self contained. Data persistence is provided using a docker VOLUME (see documentation above).

This image curently track only HEAD on miniflux master branch. Tracking of released versions will come in the near future.

A set of themes is by default shipped inside this container. The curently installed one are:
- [Bootstrap Light by Silvus](https://github.com/miniflux/theme-bootstrap-light)
- [Bootswatch Cyborg by Silvus](https://github.com/miniflux/theme-bootswatch-cyborg)
- [Cards by Augustin Lacour](https://github.com/miniflux/theme-cards)
- [Copper by Nicolas Dewaele](https://github.com/miniflux/theme-copper)
- [Green by Maxime](https://github.com/miniflux/theme-green)
- [Hello by Mirado ZAKASOA](https://github.com/meradoou/hello)
- [Hello Flat by Mirado ZAKASOA](https://github.com/meradoou/hello/tree/flat)
- [Midnight by Luca Marra](https://github.com/miniflux/theme-midnight)
- [NoStyle by Frederic Guillot](https://github.com/miniflux/theme-nostyle)
- [Still by Franklin Delehelle](https://github.com/miniflux/theme-still)
- [Sun by Alexander Mangel](https://github.com/cygnusfear/miniflux-theme-sun)

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
