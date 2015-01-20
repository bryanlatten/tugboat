FROM jwilder/nginx-proxy:latest
MAINTAINER Sean Dunn <sedunn@adobe.com>

COPY ./certs /etc/nginx/certs
