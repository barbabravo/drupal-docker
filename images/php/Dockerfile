FROM php:7.0-fpm
MAINTAINER bluers <bluers.z@gmail.com>

RUN apt-get -y autoremove && \
    apt-get -y update && \
    apt-get install -y aptitude && \
    aptitude install -y libprotobuf-dev && \
    apt-get install -y libfreetype6-dev  zlib1g-dev  libpng-dev libjpeg* libmcrypt-dev && \
    rm -rf /var/lib/apt/lists/* && \
    docker-php-ext-configure gd --enable-gd-native-ttf --with-freetype-dir=/usr/include/freetype2 --with-png-dir=/usr/include --with-jpeg-dir=/usr/include && \
    docker-php-ext-install gd iconv mysqli pdo pdo_mysql zip opcache mcrypt sockets && \
    docker-php-ext-enable opcache && \
    docker-php-ext-enable gd

COPY ./config/php.ini /usr/local/etc/php/conf.d/