FROM alpine:3.15

# install nginx and openssl
RUN	apk update && \
	apk upgrade && \ 
	apk add nginx openssl

# create directory for website files
RUN	mkdir -p /www && \
	chown -R nginx:nginx /var/lib/nginx && \
	chown -R nginx:nginx /www

# generate RSA key and x509 certificate
RUN	mkdir -p /ssl && \
	openssl req -newkey rsa:4096 -sha256 -x509 -nodes \
	-keyout /ssl/jboumal.42.fr.key -out /ssl/jboumal.42.fr.crt \
	-subj "/C=BE/ST=Bruxelles/L=Bruxelles/O=19/OU=jboumal/CN=jboumal.42.fr/"


COPY	conf/nginx.conf /etc/nginx/http.d/nginx.conf
COPY	index.html /www
EXPOSE	443/tcp


CMD	["nginx", "-g", "daemon off;"]
