ARG PHP_VERSION
ARG PHP_VARIANT

FROM php:${PHP_VERSION}-${PHP_VARIANT}-alpine

RUN apk update && apk add libzip-dev
RUN docker-php-ext-install zip

COPY --from=composer:2.1 /usr/bin/composer /usr/bin/composer

WORKDIR /opt/package
