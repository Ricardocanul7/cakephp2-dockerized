FROM php:7.4-fpm-alpine

LABEL maintainer='Ricardo Canul ricardocanul7@gmail.com'

RUN addgroup -g 1000 dev-user \
    && adduser -G dev-user -u 1000 dev-user -D


RUN apk --no-cache add \
	icu-dev \
	libpng-dev \
    libzip-dev \
	libmcrypt-dev \
	libmcrypt \
	curl-dev \
	bash

# Installing this packages will improve speed when installing php extensions
RUN apk --no-cache add \
	gcc g++ autoconf m4 libbz2 perl dpkg-dev dpkg libmagic file \
	libgcc libstdc++ binutils gmp isl libgomp libatomic mpfr3 mpc1 gcc musl-dev \
	libc-dev make re2c

RUN docker-php-ext-install intl \
    && docker-php-ext-install gd \
	&& docker-php-ext-install exif \
    && docker-php-ext-install zip \
	&& docker-php-ext-install bcmath \
    && docker-php-ext-install curl \
    && docker-php-ext-install pdo \
	&& docker-php-ext-install pdo_mysql

RUN pecl install mcrypt

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

RUN  rm -rf /var/cache/apk/*

WORKDIR /var/www/myapp
