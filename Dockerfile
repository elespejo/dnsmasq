FROM alpine

RUN apk update && \
    apk upgrade && \
    apk add --update bash dnsmasq && \
    rm -rf /var/cache/apk/*

COPY init ./

VOLUME /etc/dnsmasq
VOLUME /etc/dnsmasq.d

ENTRYPOINT ./init
