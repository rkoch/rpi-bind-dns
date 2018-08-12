FROM alpine:latest
MAINTAINER lauster@lauster.dk

ENV DATA_DIR=/data \
    BIND_USER=named

RUN apk update \
    && apk upgrade \
    && apk add --no-cache bind bash \
    && cd / \
    && rm -rf /tmp/*.gz  \
    && rm -rf /var/cache/apk/*

COPY entrypoint.sh /sbin/entrypoint.sh
RUN chmod 755 /sbin/entrypoint.sh

EXPOSE 53/udp 53/tcp
VOLUME ["${DATA_DIR}"]
ENTRYPOINT ["/sbin/entrypoint.sh"]
CMD ["/usr/sbin/named"]
