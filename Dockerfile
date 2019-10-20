FROM alpine:3.10

LABEL maintainer "Nicolas Coutin <ilshidur@gmail.com>"

RUN apk --no-cache add tor bash tzdata
ENV TZ America/Los_Angeles

EXPOSE 9001

ENV RELAY_TYPE relay
ENV TOR_ORPort 9001
ENV TOR_ContactInfo "Random Person nobody@tor.org"
ENV TOR_RelayBandwidthRate "100 KBytes"
ENV TOR_RelayBandwidthBurst "200 KBytes"

COPY torrc.bridge.default /etc/tor/torrc.bridge.default
COPY torrc.relay.default /etc/tor/torrc.relay.default
COPY torrc.exit.default /etc/tor/torrc.exit.default

RUN chown -R tor /etc/tor

COPY entrypoint.sh /entrypoint.sh
RUN chmod ugo+rx /entrypoint.sh

USER tor

RUN mkdir /var/lib/tor/.tor
VOLUME /var/lib/tor/.tor
RUN chown -R tor /var/lib/tor/.tor

ENTRYPOINT [ "/entrypoint.sh" ]
