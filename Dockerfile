FROM ghcr.io/linuxserver/baseimage-alpine:3.23

LABEL org.opencontainers.image.title="tor-relay" \
      org.opencontainers.image.description="Tor relay on Linuxserver.io Alpine base image" \
      org.opencontainers.image.authors="Nicolas Coutin <ilshidur@gmail.com>" \
      org.opencontainers.image.licenses="MIT"

ENV XDG_DATA_HOME=/config \
    XDG_CONFIG_HOME=/config \
    TZ=America/Los_Angeles \
    RELAY_TYPE=relay \
    TOR_ORPort=9001 \
    TOR_DirPort=9030 \
    TOR_DataDirectory=/data \
    TOR_ContactInfo="Random Person <nobody@example.com>" \
    PUID=1000 \
    PGID=1000

RUN apk --no-cache add \
      bash \
      tzdata \
      tor=0.4.9.8-r0 && \
    mkdir -p /config /data && \
    chown -R abc:abc /config /data

COPY --chown=abc:abc torrc.bridge.default /config/torrc.bridge.default
COPY --chown=abc:abc torrc.relay.default  /config/torrc.relay.default
COPY --chown=abc:abc torrc.exit.default   /config/torrc.exit.default

COPY entrypoint.sh /entrypoint.sh
RUN chmod ugo+rx /entrypoint.sh

COPY root/ /

EXPOSE 9001 9030

VOLUME /data

WORKDIR /config
