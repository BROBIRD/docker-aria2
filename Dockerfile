FROM debian:latest as builder
MAINTAINER BROBIRD <brobirdcn@gmail.com>

COPY build_aria2.sh build_aria2.sh

RUN chmod +x build_aria2.sh \
    ./build_aria2.sh


FROM alpine:latest

COPY root/ /
COPY --from=builder /tmp/aria2/src/aria2c /aria2c

RUN apk update \ 
    && apk add ca-certificates \
    && rm -rf /var/cache/apk/* \
    && set -xe \
    && chmod +x /aria2c \
    && chmod +x /init.sh

VOLUME /config /downloads

EXPOSE 6800 6882

ENTRYPOINT ["/init.sh"]
