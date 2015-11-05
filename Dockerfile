FROM jwilder/nginx-proxy:0.2.0
MAINTAINER Sean Dunn <sedunn@adobe.com>

COPY ./nginx.tmpl /app/nginx.tmpl
COPY ./certs /etc/nginx/certs

VOLUME ["/app"]
