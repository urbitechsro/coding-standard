FROM composer:2 as composer

COPY . /coding-standard
WORKDIR /coding-standard

RUN composer install --ignore-platform-reqs --no-interaction

FROM php:8-cli-alpine

RUN apk add icu-dev --no-cache && \
  docker-php-ext-configure intl && \
  docker-php-ext-install intl

COPY --from=composer /coding-standard /coding-standard
WORKDIR /coding-standard

ENTRYPOINT [ "php", "ecs" ]