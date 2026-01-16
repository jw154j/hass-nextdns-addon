ARG BUILD_FROM
FROM $BUILD_FROM

# Install NextDNS CLI
RUN apk add --no-cache curl && \
    sh -c "$(curl -sL https://nextdns.io/install)" && \
    apk del curl

# Expose DNS ports
EXPOSE 53/tcp 53/udp

CMD ["/usr/local/bin/nextdns", "run", "-config", "/config/nextdns.conf"]
