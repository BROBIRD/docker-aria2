FROM alpine:latest
MAINTAINER BROBIRD <brobirdcn@gmail.com>

COPY root/ /

RUN apk update \ 
    && apk add ca-certificates \
    && rm -rf /var/cache/apk/* \
    && wget -O /aria2c https://github.com/BROBIRD/docker-aria2/releases/download/1.34.0-4096/aria2c \
    && set -xe \
    && chmod +x /aria2c \
    && chmod +x /init.sh

VOLUME /config /downloads

EXPOSE 6800

ENTRYPOINT ["/init.sh"]
