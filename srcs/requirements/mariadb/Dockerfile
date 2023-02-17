FROM alpine:3.15

# install mariadb
RUN	apk update && \
	apk upgrade && \ 
	apk add --no-cache mariadb gettext moreutils

RUN mkdir -p /run/mysqld && \
    chown -R mysql:mysql /run/mysqld && \
    chmod 777 /run/mysqld


# copy config files
COPY tools/init.sql /tools/
COPY tools/entrypoint.sh /tools/

# execute service
ENTRYPOINT [ "/tools/entrypoint.sh" ]

USER mysql
CMD [ "mysqld", "--skip-grant-tables" , "--bind-address 0.0.0.0", "--init-file /tools/init.sql" ]