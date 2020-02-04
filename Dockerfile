FROM php:7.3-apache-buster
LABEL version="0.1"
LABEL maintainer="Soragan Ong <soragan@alagas.net>"

RUN usermod -a -G users www-data && a2enmod rewrite && apt update
