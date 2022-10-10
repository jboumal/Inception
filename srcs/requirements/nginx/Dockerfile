FROM alpine:3.15

# update and install nginx server
RUN apk update
    apk upgrade
    apk add nginx

CMD ["nginx", "-g", "daemon off;"]