FROM composer:2 as composer

COPY . /coding-standard
WORKDIR /coding-standard

RUN composer install --ignore-platform-reqs --no-interaction

FROM php:8.0-cli-alpine

RUN apk add icu-dev --no-cache && \
  docker-php-ext-configure intl && \
  docker-php-ext-install intl && \
  mkdir /temp

COPY --from=composer /coding-standard /coding-standard
WORKDIR /coding-standard

ENV CACHE_DIRECTORY=/temp

ENTRYPOINT [ "php", "ecs" ]