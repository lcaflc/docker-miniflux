FROM php:5-apache
MAINTAINER Laurent Corbes <caf@glot.net>

# add needed git and extra dev packages
RUN apt-get update && apt-get install -y git

# add needed php modules
RUN apt-get install -y libsqlite3-dev libcurl4-gnutls-dev && docker-php-ext-install -j$(nproc) mbstring iconv pdo_sqlite curl

# installing app
ENV APPDIR /var/www/html
RUN cd /var/www \
  && git clone --depth 1 https://github.com/miniflux/miniflux.git
RUN rm -rf $APPDIR \
  && mv /var/www/miniflux $APPDIR
RUN chown -R www-data:www-data $APPDIR/data
WORKDIR $APPDIR

# installing themes
RUN cd themes \
  && git clone https://github.com/miniflux/theme-bootstrap-light.git \
  && git clone https://github.com/miniflux/theme-bootswatch-cyborg.git \
  && git clone https://github.com/miniflux/theme-cards.git \
  && git clone https://github.com/miniflux/theme-nostyle.git \
  && git clone https://github.com/miniflux/theme-still.git \
  && git clone https://github.com/miniflux/theme-green.git \
  && git clone https://github.com/miniflux/theme-midnight.git \
  && git clone https://github.com/miniflux/theme-copper.git \
  && git clone https://github.com/meradoou/hello.git \
  && git clone -b flat https://github.com/meradoou/hello.git hello-flat \
  && git clone https://github.com/Cygnusfear/Miniflux-Theme-Sun.git \
  && git clone https://github.com/lacereation/minflux-theme.git /tmp/emm && mv /tmp/emm/themes/* . && rm -rf /tmp/emm


# cleanup
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

VOLUME /var/www/html/data
