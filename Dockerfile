ARG PHP_VERSION
ARG PHP_VARIANT
ARG COMPOSER_VERSION

FROM composer:${COMPOSER_VERSION} as composer

FROM php:${PHP_VERSION}-${PHP_VARIANT}-alpine

RUN apk update && apk add libzip-dev
RUN docker-php-ext-install zip

COPY --from=composer /usr/bin/composer /usr/bin/composer

WORKDIR /opt/package
