FROM ghcr.io/linuxserver/baseimage-alpine:3.22

# OCI-konforme Metadaten (statt nur "maintainer")
LABEL org.opencontainers.image.title="tor-relay" \
      org.opencontainers.image.description="Tor relay on Linuxserver.io Alpine base image" \
      org.opencontainers.image.authors="Nicolas Coutin <ilshidur@gmail.com>" \
      org.opencontainers.image.licenses="MIT"

# Basis-Umgebungsvariablen
ENV XDG_DATA_HOME=/config \
    XDG_CONFIG_HOME=/config \
    TZ=America/Los_Angeles \
    RELAY_TYPE=relay \
    TOR_ORPort=9001 \
    TOR_DirPort=9030 \
    TOR_DataDirectory=/data \
    TOR_ContactInfo="Random Person nobody@tor.org"

# Pakete installieren
RUN apk --no-cache add \
      bash \
      tzdata \
      tor

EXPOSE 9001 9030

# Default-TOR-Konfigurationen
COPY torrc.bridge.default /config/torrc.bridge.default
COPY torrc.relay.default  /config/torrc.relay.default
COPY torrc.exit.default   /config/torrc.exit.default

COPY entrypoint.sh /entrypoint.sh

COPY root/ /
VOLUME /data

RUN chmod 755 /entrypoint.sh \
    && chmod 755 /etc/services.d/tor/run || true

WORKDIR /config