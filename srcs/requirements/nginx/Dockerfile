FROM alpine:3.15

# update and install nginx server
RUN	apk update && \
	apk upgrade && \ 
	apk add nginx && \
	adduser -D -g 'www' www && \
	mkdir -p /www && \
	chown -R www:www /var/lib/nginx && \
	chown -R www:www /www

COPY	conf/nginx.conf /etc/nginx/http.d/nginx.conf
COPY	index.html /www
EXPOSE 80/tcp


CMD	["nginx", "-g", "daemon off;"]
