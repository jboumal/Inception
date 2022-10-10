FROM alpine:3.15

# update and install nginx server
RUN	apk update && \
	apk upgrade && \ 
	apk add nginx && \
	mkdir -p /run/nginx	
COPY	conf/nginx.conf /etc/nginx/conf.d/default.conf

CMD	nginx -g daemon off;
