FROM php:8.1-cli-alpine

RUN apk add icu-dev wget --no-cache && \
  docker-php-ext-configure intl && \
  docker-php-ext-install intl && \
  mkdir /temp

COPY . /coding-standard
WORKDIR /coding-standard

RUN wget https://getcomposer.org/download/latest-stable/composer.phar
RUN php composer.phar install --no-interaction
RUN rm composer.phar
ENV CACHE_DIRECTORY=/temp

ENTRYPOINT [ "php", "ecs" ]