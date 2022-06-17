FROM php:5.6-fpm-alpine

RUN apk --no-cache add \
	libpng-dev \
    libzip-dev \
	libmcrypt \
	libmcrypt-dev \
	curl-dev \
	bash \
	&& docker-php-ext-install exif \
    && docker-php-ext-install gd \
    && docker-php-ext-install curl \
    && docker-php-ext-install zip \
	&& docker-php-ext-configure mcrypt \
	&& docker-php-ext-install mcrypt \
    && docker-php-ext-install pdo_mysql


#RUN ln -s /usr/bin/php5 /usr/bin/php
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

RUN  rm -rf /var/cache/apk/*

WORKDIR /var/www/myapp
