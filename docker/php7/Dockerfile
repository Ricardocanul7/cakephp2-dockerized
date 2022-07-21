FROM php:7.1-fpm-alpine

RUN apk --no-cache add \
	icu-dev \
	libpng-dev \
    libzip-dev \
	libmcrypt-dev \
	libmcrypt \
	curl-dev \
	bash \
	&& docker-php-ext-install intl \
    && docker-php-ext-install gd \
	&& docker-php-ext-install exif \
    && docker-php-ext-install zip \
	&& docker-php-ext-install bcmath \
    && docker-php-ext-install curl \
    && docker-php-ext-install pdo \
	&& docker-php-ext-install pdo_mysql \
	&& docker-php-ext-configure mcrypt \
	&& docker-php-ext-install mcrypt

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

RUN  rm -rf /var/cache/apk/*

WORKDIR /var/www/myapp
