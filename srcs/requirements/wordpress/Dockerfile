FROM alpine:3.15

# PHP-FPM is a method of processing PHP pages with NGINX
# install PHP-FPM and dependencies
RUN apk update && \
    apk upgrade
#	apk add curl php-fpm mariadb-client php-mysql

RUN	apk add curl 
RUN apk add php-fpm 
RUN apk add mariadb-client
RUN apk add php php-opcache


# copy config files
COPY tools/php-fpm.conf /etc/php/7.4/fpm/php-fpm.conf
COPY tools/config.sh /tools/

# execute service
ENTRYPOINT [ "/tools/config.sh" ]
EXPOSE 9000
CMD ["php-fpm7.4", "-F"]