FROM php:5-apache
MAINTAINER Laurent Corbes <caf@glot.net>

# add needed git and extra dev packages
RUN apt-get update && apt-get install -y git

# add needed php modules
RUN apt-get install -y libsqlite3-dev libcurl4-gnutls-dev && docker-php-ext-install -j$(nproc) mbstring iconv pdo_sqlite curl

# installing app
RUN cd /var/www && git clone --depth 1 https://github.com/miniflux/miniflux.git
RUN rm -rf /var/www/html && mv /var/www/miniflux /var/www/html
RUN chown -R www-data:www-data /var/www/html/data

# cleanup
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

VOLUME /var/www/html/data
