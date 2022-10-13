FROM alpine:3.15

# update and install nginx server
RUN	apk update && \
	apk upgrade && \ 
	apk add nginx && \
	mkdir -p /www && \
	chown -R nginx:nginx /var/lib/nginx && \
	chown -R nginx:nginx /www

COPY	conf/nginx.conf /etc/nginx/http.d/nginx.conf
COPY	index.html /www
EXPOSE 80/tcp


CMD	["nginx", "-g", "daemon off;"]
