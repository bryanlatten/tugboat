FROM jwilder/nginx-proxy:latest
MAINTAINER Sean Dunn <sedunn@adobe.com>

COPY ./nginx.tmpl /app/nginx.tmpl
COPY ./certs /etc/nginx/certs

VOLUME ["/app"]
