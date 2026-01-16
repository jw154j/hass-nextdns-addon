ARG BUILD_FROM=ghcr.io/hassio-addons/base:3.16
FROM $BUILD_FROM

# Install curl + NextDNS
RUN apk add --no-cache curl && \
    curl -sL https://nextdns.io/install | sh -s -- -i && \
    apk del curl

COPY run.sh /run.sh
RUN chmod +x /run.sh
CMD ["/run.sh"]
