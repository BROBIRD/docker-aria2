FROM alpine:latest
MAINTAINER BROBIRD <brobirdcn@gmail.com>

COPY root/ /

RUN set -xe \
    && chmod +x /aria2c \
    && chmod +x /init.sh

VOLUME /config /downloads

EXPOSE 6800

ENTRYPOINT ["/init.sh"]
