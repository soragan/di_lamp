FROM php:7.3-apache-buster
LABEL version="0.1"
LABEL maintainer="Soragan Ong <soragan@alagas.net>"

RUN usermod -a -G users www-data \
    && a2enmod rewrite \
    && apt update \
    && mkdir /var/www/html/public \
    && mkdir /var/www/html/private

## Change Document Root
ENV APACHE_DOCUMENT_ROOT /var/www/html/public
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf
